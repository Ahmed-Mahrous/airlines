import 'package:airlines/features/home/data/models/airline_model.dart';
import 'package:airlines/features/home/presentation/manager/cubit/fav_cubit/fav_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavCubit extends Cubit<FavCubitStates> {
  FavCubit() : super(FavInitial());
  List<AirlineModel> favList = [];

  void addFav(AirlineModel airline) {
    favList.add(airline);
    emit(FavListAdded(favList: List.from(favList)));
    emit(FavListUpdated());
  }

  void removeFav(AirlineModel airline) {
    favList.remove(airline);
    emit(FavListRemoved(favList: List.from(favList)));
    emit(FavListUpdated());
  }
}
