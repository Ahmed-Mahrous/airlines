import 'package:airlines/core/error/failure.dart';
import 'package:airlines/features/airlines/data/models/airline_model.dart';
import 'package:dartz/dartz.dart';

abstract class AirlineRepo {
  Future<Either<Failure, List<AirlineModel>>> fetchAirLines();
}
