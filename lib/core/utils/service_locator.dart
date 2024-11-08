import 'package:airlines/core/network/api_service.dart';
import 'package:airlines/features/airlines/data/repositories/airline_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(
    Dio(),
  ));
  getIt.registerSingleton<AirlineRepoImpl>(
    AirlineRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
