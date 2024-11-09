import 'package:airlines/features/details/presentation/views/airline_details.dart';
import 'package:airlines/features/home/data/models/airline_model.dart';
import 'package:airlines/features/home/presentation/views/home_screen.dart';
import 'package:airlines/features/search/presentation/views/search_screen.dart';
import 'package:airlines/features/settings/presentation/views/settings_screen.dart';
import 'package:airlines/features/splash/persentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeScreen = '/home_screen';
  static const kDetailsScreen = '/airline_details_screen';
  static const kSearchScreen = '/search_screen';
  static const kSettingsScreen = '/settings_screen';

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
        builder: (context, state) => AirlineDetailsScreen(
          airline: state.extra as AirlineModel,
        ),
      ),
      GoRoute(
        path: kSearchScreen,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: kSettingsScreen,
        builder: (context, state) => SettingsScreen(),
      ),
    ],
  );
}
