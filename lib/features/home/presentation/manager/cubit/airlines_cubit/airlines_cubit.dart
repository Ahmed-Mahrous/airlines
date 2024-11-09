import 'package:airlines/features/home/data/repositories/home_repo.dart';
import 'package:airlines/features/home/presentation/manager/cubit/airlines_cubit/airlines_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AirlinesCubit extends Cubit<AirlinesCubitStates> {
  AirlinesCubit(this.homeRepo) : super(AirlinesInitial());
  final HomeRepo homeRepo;
  Future<void> getAirlines() async {
    emit(AirlinesLoading());
    final result = await homeRepo.fetchAirLines();
    result.fold((failure) => emit(AirlinesError(failure.errMessage)),
        (airlines) => emit(AirlinesLoaded(airlines: airlines)));
  }
}
