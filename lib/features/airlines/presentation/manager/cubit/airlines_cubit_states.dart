import 'package:airlines/features/airlines/data/models/airline_model.dart';
import 'package:equatable/equatable.dart';

class AirlinesCubitStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class AirlinesInitial extends AirlinesCubitStates {}

class AirlinesLoading extends AirlinesCubitStates {}

class AirlinesLoaded extends AirlinesCubitStates {
  final List<AirlineModel> airlines;
  AirlinesLoaded({required this.airlines});
}

class AirlinesError extends AirlinesCubitStates {
  final String message;
  AirlinesError(this.message);
}
