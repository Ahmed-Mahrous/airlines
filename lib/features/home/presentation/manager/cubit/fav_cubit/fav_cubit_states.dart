import 'package:airlines/features/home/data/models/airline_model.dart';
import 'package:equatable/equatable.dart';

class FavCubitStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavInitial extends FavCubitStates {}

class FavListAdded extends FavCubitStates {
  final List<AirlineModel> favList;
  FavListAdded({required this.favList});
}

class FavListRemoved extends FavCubitStates {
  final List<AirlineModel> favList;
  FavListRemoved({required this.favList});
}

class FavListUpdated extends FavCubitStates {}
