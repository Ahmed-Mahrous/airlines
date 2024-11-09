import 'package:airlines/features/home/data/models/airline_model.dart';
import 'package:airlines/features/home/presentation/manager/cubit/fav_cubit/fav_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class FavCubit extends Cubit<FavCubitStates> {
  FavCubit() : super(FavInitial());
  List<AirlineModel> favList = [];
  final String boxName = 'airlineBox';

  Future<void> openBox() async {
    await Hive.openBox<AirlineModel>(boxName);
  }

  Future<void> loadAirlines() async {
    final box = Hive.box<AirlineModel>(boxName);
    if (box.isEmpty) {
    } else {
      favList = box.values.toList().cast<AirlineModel>();
      emit(CachedFavListLoaded(
          favList: box.values.toList().cast<AirlineModel>()));
    }
  }

  Future<void> saveAirlines(List<AirlineModel> airlines) async {
    final box = Hive.box<AirlineModel>(boxName);
    await box.clear(); // Clear existing cache
    for (var airline in airlines) {
      await box.add(airline); // Save each airline
    }
    emit(FavListCached(favList: airlines));
  }

  void addFav(AirlineModel airline) {
    favList.add(airline);
    saveAirlines(favList);
    emit(FavListAdded(favList: List.from(favList)));
    emit(FavListUpdated(favList: favList));
  }

  void removeFav(AirlineModel airline) {
    favList.remove(airline);
    saveAirlines(favList);
    emit(FavListRemoved(favList: List.from(favList)));
    emit(FavListUpdated(favList: favList));
  }
}
