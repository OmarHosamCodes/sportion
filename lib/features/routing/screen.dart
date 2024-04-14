import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sportion/library.dart';

/// A screen widget for routing.
///
/// This widget represents a screen that can be used for routing purposes.
/// It takes a [child] widget and a [state] of type [GoRouterState].
class RoutingScreen extends StatefulWidget {
  /// Constructs a [RoutingScreen] widget.
  const RoutingScreen({
    required this.child,
    required this.state,
    super.key,
  });

  /// The child widget to be displayed on the screen.
  final Widget child;

  /// The state of the router.
  final GoRouterState state;

  @override
  State<RoutingScreen> createState() => _RoutingScreenState();
}

class _RoutingScreenState extends State<RoutingScreen> {
  static const routes = [
    Routes.home,
    Routes.bmr,
    Routes.water,
    Routes.profile,
  ];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        switch (snapshot.data) {
          case User():
            return Scaffold(
              bottomNavigationBar: SalomonBottomBar(
                items: [
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.home),
                    title: const Text('Home'),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.whatshot),
                    title: const Text('BMR'),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.water_drop),
                    title: const Text('Water Intake'),
                  ),
                  SalomonBottomBarItem(
                    icon: const Icon(Icons.person),
                    title: const Text('Profile'),
                  ),
                ],
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.deepPurple,
                currentIndex: routes.indexOf(widget.state.uri.toString()),
                onTap: (index) {
                  RoutingRepository.router.go(
                    routes[index],
                  );
                },
              ),
              body: widget.child,
            );

          case null:
            return const AuthScreen();
        }
      },
    );
  }
}
