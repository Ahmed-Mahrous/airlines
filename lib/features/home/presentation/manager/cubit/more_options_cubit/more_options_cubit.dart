import 'package:airlines/features/home/presentation/manager/cubit/more_options_cubit/more_options_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum OptionsItem { all, fav, cancel }

class MoreOptionsCubit extends Cubit<MoreOptionsCubitStates> {
  MoreOptionsCubit()
      : super(MoreOptionsInitial(selectedOption: OptionsItem.all));
  void getAllAirlines() {
    emit(AllAirlinesOptionState(selectedOption: OptionsItem.all));
  }

  void getFavAirlines() {
    emit(FavAirlinesOptionState(selectedOption: OptionsItem.fav));
  }
}
