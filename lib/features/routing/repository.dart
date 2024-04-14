import 'package:sportion/library.dart';

class RoutingRepository {
  static final RoutingRepository instance = RoutingRepository();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;
  static final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: Routes.home,
    routes: [
      ShellRoute(
        builder: (context, state, child) => RoutingScreen(
          state: state,
          child: child,
        ),
        routes: [
          GoRoute(
            path: Routes.home,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: Routes.profile,
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: Routes.bmr,
            builder: (context, state) => const BMRScreen(),
          ),
          GoRoute(
            path: Routes.water,
            builder: (context, state) => const WaterScreen(),
          ),
        ],
      ),
      GoRoute(
        path: Routes.nutrition,
        builder: (context, state) => const NutritionScreen(),
      ),
      GoRoute(
        path: Routes.excerisesCategories,
        builder: (context, state) => const ExcerisesScreen(),
      ),
      GoRoute(
        path: Routes.community,
        builder: (context, state) => const CommumityScreen(),
      ),
      GoRoute(
        path: Routes.addPost,
        builder: (context, state) => const AddPostScreen(),
      ),
      GoRoute(
        name: Routes.excerisesDetailsRoot,
        path: Routes.excerisesDetails,
        builder: (context, state) => DetailsScreen(
          extra: state.extra,
        ),
      ),
      GoRoute(
        name: Routes.authRoot,
        path: Routes.auth,
        builder: (context, state) => const AuthScreen(),
      ),
    ],
  );

  static void go(String route) {
    router.go(route);
  }

  static void push(String route) {
    router.push(route);
  }

  static void pushNamed(String route, {dynamic extra}) {
    router.pushNamed(route, extra: extra);
  }

  static void pop() {
    router.pop();
  }
}
