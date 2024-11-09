import 'package:airlines/core/routes/app_router.dart';
import 'package:airlines/core/utils/app_strings.dart';
import 'package:airlines/core/utils/service_locator.dart';
import 'package:airlines/features/home/data/repositories/home_repo_impl.dart';
import 'package:airlines/features/home/presentation/manager/cubit/airlines_cubit/airlines_cubit.dart';
import 'package:airlines/features/home/presentation/manager/cubit/fav_cubit/fav_cubit.dart';
import 'package:airlines/features/home/presentation/manager/cubit/more_options_cubit/more_options_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  getItSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AirlinesCubit(getIt.get<HomeRepoImpl>())..getAirlines(),
        ),
        BlocProvider(
          create: (context) => FavCubit(),
        ),
        BlocProvider(
          create: (context) => MoreOptionsCubit(),
        ),
      ],
      child: MaterialApp.router(
        title: AppStrings.appTitle,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
