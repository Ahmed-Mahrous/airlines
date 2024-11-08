import 'package:airlines/features/airlines/presentation/screens/airline_details.dart';
import 'package:airlines/features/airlines/presentation/screens/home_screen.dart';
import 'package:airlines/features/search/presentation/screens/search_screen.dart';
import 'package:airlines/features/splash/persentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeScreen = '/home_screen';
  static const kDetailsScreen = '/airline_details_screen';
  static const kSearchScreen = '/search_screen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kDetailsScreen,
        builder: (context, state) => const AirlineDetailsScreen(),
      ),
      GoRoute(
        path: kSearchScreen,
        builder: (context, state) => const SearchScreen(),
      ),
    ],
  );
}
