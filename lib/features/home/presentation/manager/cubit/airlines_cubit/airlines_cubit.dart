import 'package:airlines/features/home/data/models/airline_model.dart';
import 'package:airlines/features/home/data/repositories/home_repo.dart';
import 'package:airlines/features/home/presentation/manager/cubit/airlines_cubit/airlines_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AirlinesCubit extends Cubit<AirlinesCubitStates> {
  AirlinesCubit(this.homeRepo) : super(AirlinesInitial());

  List<AirlineModel> filteredList = [];
  List<AirlineModel> allList = [];

  final HomeRepo homeRepo;
  Future<void> getAirlines() async {
    emit(AirlinesLoading());
    final result = await homeRepo.fetchAirLines();
    result.fold((failure) => emit(AirlinesError(failure.errMessage)),
        (airlines) {
      allList = airlines;
      emit(AirlinesLoaded(airlines: airlines));
    });
  }

  void filterByName(String query) {
    if (query.isEmpty) {
      filteredList = [];
    } else {
      filteredList = allList
          .where((airline) =>
              airline.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      if (filteredList.isEmpty) {
        Fluttertoast.showToast(
          msg: "Name Not Found",
          toastLength: Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
          gravity: ToastGravity.BOTTOM, // position: top, bottom, center
          fontSize: 16.0,
        );
      }
    }
  }
}
