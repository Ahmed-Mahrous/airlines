import 'package:airlines/features/airlines/data/repositories/airline_repo.dart';
import 'package:airlines/features/airlines/presentation/manager/cubit/airlines_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AirlinesCubit extends Cubit<AirlinesCubitStates> {
  AirlinesCubit(super.initialState, this.airlineRepo);
  final AirlineRepo airlineRepo;
  Future<void> getAirlines() async {
    emit(AirlinesLoading());
    final result = await airlineRepo.fetchAirLines();
    result.fold((failure) => emit(AirlinesError(failure.errMessage)),
        (airlines) => emit(AirlinesLoaded(airlines: airlines)));
  }
}
