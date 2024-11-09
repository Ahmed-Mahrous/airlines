import 'package:airlines/core/routes/app_router.dart';
import 'package:airlines/core/theme_provider/theme_provider.dart';
import 'package:airlines/core/utils/app_strings.dart';
import 'package:airlines/core/utils/service_locator.dart';
import 'package:airlines/features/home/data/models/airline_model.dart';
import 'package:airlines/features/home/data/repositories/home_repo_impl.dart';
import 'package:airlines/features/home/presentation/manager/cubit/airlines_cubit/airlines_cubit.dart';
import 'package:airlines/features/home/presentation/manager/cubit/fav_cubit/fav_cubit.dart';
import 'package:airlines/features/home/presentation/manager/cubit/more_options_cubit/more_options_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeProvider = await ThemeProvider.loadTheme();
  await Hive.initFlutter();
  Hive.registerAdapter(AirlineModelAdapter()); // Register the adapter
  getItSetup();
  await Hive.openBox<AirlineModel>('airlineBox');
  runApp(
    ChangeNotifierProvider(
      create: (context) => themeProvider,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AirlinesCubit(getIt.get<HomeRepoImpl>())..getAirlines(),
        ),
        BlocProvider(
          create: (context) => FavCubit()
            ..openBox()
            ..loadAirlines(),
        ),
        BlocProvider(
          create: (context) => MoreOptionsCubit(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, themeProvider, Widget? child) {
          return MaterialApp.router(
            themeMode: themeProvider.themeMode,
            darkTheme: ThemeData.dark(),
            theme: ThemeData.light(),
            title: AppStrings.appTitle,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
