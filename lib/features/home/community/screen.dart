import 'package:sportion/features/home/community/widgets.dart';
import 'package:sportion/library.dart';

class CommumityScreen extends StatelessWidget {
  const CommumityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Community'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => RoutingRepository.push(Routes.addPost),
          ),
        ],
      ),
      body: FutureBuilder<List<Post>>(
        future: CommunityRepository.instance.fetchPosts(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                final posts = snapshot.data!;
                return ListView.separated(
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: CustomDivider.horizontal(
                      length: context.width.toInt(),
                    ),
                  ),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return PostWidget(post: post);
                  },
                );
              } else {
                return const Center(child: CustomText(text: 'No data'));
              }
            default:
              return Center(child: CustomText(text: snapshot.error.toString()));
          }
        },
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CommunityRepository.instance.fetchUser(post.author),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final author = snapshot.data as UserModel;
          return Card.filled(
            color: const Color(0xFF1C1B1F),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(author.imageUrl),
                  ),
                  title: CustomText(text: author.name),
                  subtitle: CustomText(
                    text: CommunityRepository.instance.timeAgo(post.date),
                  ),
                  trailing: Visibility(
                    visible: post.author ==
                        CommunityRepository.instance.currentUser!.uid,
                    child: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        CustomPopups.show(
                          CustomPopups.confirmationDialog(
                            title: 'Delete Post',
                            content:
                                'Are you sure you want to delete this post?',
                            onConfirm: () {
                              CommunityRepository.instance.deletePost(post.id);
                              RoutingRepository.pop();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpandableText(
                    key: Key(post.id),
                    text: post.body,
                  ),
                ),
                if (post.image != null)
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: CustomImage(
                          source: post.image ?? '', fit: BoxFit.cover),
                    ),
                  )
                else
                  const SizedBox(),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}