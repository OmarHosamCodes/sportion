import 'package:sportion/library.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: CustomGlassMorphismContainer(
          padding: const EdgeInsets.all(10),
          child: Consumer(
            builder: (_, WidgetRef ref, __) {
              final userWatcher = ref.watch(userProvider);
              return userWatcher.maybeWhen(
                data: (user) => CustomImage(
                  source: user!.imageUrl,
                  width: 60.0,
                  height: 60.0,
                  fallbackIcon: Icons.person,
                  fit: BoxFit.contain,
                ),
                orElse: () => const Icon(Icons.person),
              );
            },
          ),
        ),
        leadingWidth: 70,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => AuthRepository().signOut(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const CustomGap(),
            Consumer(
              builder: (_, WidgetRef ref, __) {
                final userWatcher = ref.watch(userProvider);
                return userWatcher.maybeWhen(
                  data: (user) => CustomSideBySide(
                    input: ("Name", user!.name),
                    ratio: (1, 4),
                  ),
                  orElse: () => const CustomSideBySide(
                    input: ("Name", "Loading..."),
                    ratio: (1, 4),
                  ),
                );
              },
            ),
            const CustomGap(),
            Consumer(
              builder: (_, WidgetRef ref, __) {
                final userWatcher = ref.watch(userProvider);
                return userWatcher.maybeWhen(
                  data: (user) => CustomSideBySide(
                    input: ("Email", user!.email),
                    ratio: (1, 4),
                  ),
                  orElse: () => const CustomSideBySide(
                    input: ("Email", "Loading..."),
                    ratio: (1, 4),
                  ),
                );
              },
            ),
            const CustomGap(),
            Consumer(
              builder: (_, WidgetRef ref, __) {
                final userWatcher = ref.watch(userProvider);
                return userWatcher.maybeWhen(
                  data: (user) => Column(
                    children: [
                      CustomSideBySide(
                        input: ("BMR", "${user!.bmr} Kcal/day"),
                        ratio: (1, 4),
                      ),
                      const CustomGap(),
                      CustomSideBySide(
                        input: ("Water Intake", "${user.waterIntake} l/day"),
                        ratio: (2, 4),
                      ),
                    ],
                  ),
                  orElse: () => const Column(
                    children: [
                      CustomSideBySide(
                        input: ("BMR", "Loading..."),
                        ratio: (1, 4),
                      ),
                      CustomGap(),
                      CustomSideBySide(
                        input: ("Water Intake", "Loading..."),
                        ratio: (2, 4),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
