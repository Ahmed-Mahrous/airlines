import 'package:airlines/core/error/failure.dart';
import 'package:airlines/core/network/api_service.dart';
import 'package:airlines/core/utils/app_strings.dart';
import 'package:airlines/features/home/data/models/airline_model.dart';
import 'package:airlines/features/home/data/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<AirlineModel>>> fetchAirLines() async {
    try {
      var data = await apiService.get(
          endPoint: AppStrings.endPoint, baseUrl: AppStrings.baseUrl);
      List<AirlineModel> airlineList = [];
      for (var element in data) {
        airlineList.add(AirlineModel.fromJson(element));
      }
      return Right(airlineList);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
