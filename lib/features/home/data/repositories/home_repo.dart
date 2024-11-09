import 'package:airlines/core/error/failure.dart';
import 'package:airlines/features/home/data/models/airline_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<AirlineModel>>> fetchAirLines();
}
