import 'package:airlines/core/routes/app_router.dart';
import 'package:airlines/core/utils/app_strings.dart';
import 'package:airlines/core/utils/service_locator.dart';
import 'package:airlines/features/airlines/data/repositories/airline_repo_impl.dart';
import 'package:airlines/features/airlines/presentation/manager/cubit/airlines_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AirlinesCubit(getIt.get<AirlineRepoImpl>()),
      child: MaterialApp.router(
        title: AppStrings.appTitle,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
