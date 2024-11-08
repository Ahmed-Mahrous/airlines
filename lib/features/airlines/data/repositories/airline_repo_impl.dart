import 'package:airlines/core/error/failure.dart';
import 'package:airlines/core/network/api_service.dart';
import 'package:airlines/core/utils/app_strings.dart';
import 'package:airlines/features/airlines/data/models/airline_model.dart';
import 'package:airlines/features/airlines/data/repositories/airline_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AirlineRepoImpl implements AirlineRepo {
  final ApiService apiService;
  AirlineRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<AirlineModel>>> fetchAirLines() async {
    try {
      var data = await apiService.get(endPoint: AppStrings.endPoint);
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
