import 'package:sportion/library.dart';

class CommunityRepository {
  FirebaseAuth get authInstants => FirebaseAuth.instance;

  FirebaseFirestore get firestoreInstants => FirebaseFirestore.instance;

  FirebaseStorage get storageInstants => FirebaseStorage.instance;

  User? get currentUser => authInstants.currentUser;
  static final CommunityRepository instance = CommunityRepository();

  Future<List<Post>> fetchPosts({
    int limit = 10,
  }) {
    try {
      return firestoreInstants
          .collection('posts')
          .orderBy('date', descending: true)
          .limit(limit)
          .get()
          .then((value) {
        return value.docs.map((e) => Post.fromMap(e.data())).toList();
      });
    } catch (e) {
      return Future.value([]);
    }
  }

  Future<void> addPost(Post post) async {
    try {
      CustomPopups.show(const CustomPopups.loadingDialog());
      if (post.image == null) {
        await firestoreInstants
            .collection('posts')
            .doc(post.id)
            .set(post.toMap());
        return;
      }
      final storageRef = storageInstants
          .ref()
          .child('posts')
          .child(currentUser!.uid)
          .child('${post.author + post.date.toString()}.png');
      await storageRef.putString(post.image!, format: PutStringFormat.base64);

      final imageURL = await storageRef.getDownloadURL();
      final newPost = post.copyWith(image: imageURL);
      await firestoreInstants
          .collection('posts')
          .doc(post.id)
          .set(newPost.toMap());
      RoutingRepository.pop();
    } catch (e) {
      e.log();
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      await firestoreInstants.collection('posts').doc(postId).delete();
    } catch (e) {
      e.log();
    }
  }

  Future<UserModel> fetchUser(String uid) {
    try {
      return firestoreInstants
          .collection('users')
          .doc(uid)
          .get()
          .then((value) => UserModel.fromJson(value.data()!));
    } catch (e) {
      return Future.value(UserModel.empty());
    }
  }

  Future<String?> chooseImageFromStorage() async {
    XFile? image;
    try {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    } catch (_) {
      return null;
    }
    if (image != null) {
      if (kIsWeb) {
        final imageXFile = XFile(image.path);
        return base64Encode(await imageXFile.readAsBytes());
      } else {
        if (await Permission.storage.isDenied) {
          await Permission.storage.request();
        }
        final imageFile = File(image.path);
        return base64Encode(await imageFile.readAsBytes());
      }
    }
    return null;
  }

  bool isOneExist = true;

  /// Returns a string representing the time elapsed since the given [timestamp].
  String timeAgo(Timestamp timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp.toDate());
    switch (difference.inSeconds) {
      case < 60:
        return 'JustNow';
      case < 3600:
        final minutes = difference.inMinutes;
        return minutes == 1
            ? '$isOneExist ${'MinuteAgo'}'
            : '$minutes ${'MinutesAgo'}';
      case < 86400:
        final hours = difference.inHours;
        return hours == 1 ? '$isOneExist ${'HourAgo'}' : '$hours ${'HoursAgo'}';
      case < 2592000:
        return '${now.day}/${now.month}/${now.year}';
      case < 31536000:
        return '${now.day}/${now.month}/${now.year}';
      default:
        return '${now.day}/${now.month}/${now.year}';
    }
  }
}
