import 'package:sportion/library.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  FirebaseAuth get authInstants => FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: CustomGlassMorphismContainer(
          padding: const EdgeInsets.all(10),
          child: CustomImage(
            source: authInstants.currentUser!.photoURL ?? '',
            width: 60.0,
            height: 60.0,
            fallbackIcon: Icons.person,
            fit: BoxFit.contain,
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
            CustomSideBySide(
              input: ("Name", authInstants.currentUser!.displayName!),
              ratio: (1, 4),
            ),
            const CustomGap(),
            CustomSideBySide(
              input: ("Email", authInstants.currentUser!.email!),
              ratio: (1, 4),
            ),
            const CustomGap(),
            FutureBuilder(
              future: AuthRepository.instants.getUserData(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    UserModel user = snapshot.data!;
                    return Column(
                      children: [
                        CustomSideBySide(
                          input: ("BMR", "${user.bmr} Kcal/day"),
                          ratio: (1, 4),
                        ),
                        const CustomGap(),
                        CustomSideBySide(
                          input: ("Water Intake", "${user.waterIntake} l/day"),
                          ratio: (2, 4),
                        ),
                      ],
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
