import 'package:sportion/library.dart';
import 'package:uuid/uuid.dart';

class AddPostScreen extends ConsumerStatefulWidget {
  const AddPostScreen({super.key});

  @override
  ConsumerState<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends ConsumerState<AddPostScreen> {
  late TextEditingController bodyController;
  @override
  void initState() {
    super.initState();
    bodyController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    bodyController.dispose();
  }

  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Add Post'),
        actions: [
          IconButton(
            onPressed: () async {
              final post = Post(
                id: const Uuid().v4(),
                body: bodyController.text,
                date: Timestamp.now(),
                author: CommunityRepository.instance.currentUser!.uid,
                image: imageUrl,
              );
              await CommunityRepository.instance.addPost(post);
              RoutingRepository.pop();
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: context.height * 0.2,
              child: CustomTextField(
                autoFocus: true,
                controller: bodyController,
                hintText: 'What\'s on your mind?',
                textInputAction: TextInputAction.done,
                isExpanded: true,
              ),
            ),
            const CustomGap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CustomImage(source: imageUrl ?? '', height: 100),
                    ),
                    if (imageUrl != null)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            setState(() => imageUrl = null);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 35,
                          ),
                        ),
                      ),
                  ],
                ),
                CustomButton.raised(
                  onPressed: () async {
                    final image = await CommunityRepository.instance
                        .chooseImageFromStorage();
                    if (image != null) {
                      setState(() => imageUrl = image);
                    }
                  },
                  child: const Icon(Icons.add_a_photo),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
