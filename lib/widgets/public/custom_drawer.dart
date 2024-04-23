import 'package:sportion/library.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
              leading: const Icon(Icons.person),
              title: const CustomText(text: 'Profile'),
              onTap: () => context.push(Routes.profile)),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const CustomText(text: 'Logout'),
            onTap: () => AuthRepository().signOut(),
          ),
        ],
      ),
    );
  }
}
