import 'package:airlines/features/home/presentation/manager/cubit/more_options_cubit/more_options_cubit.dart';
import 'package:equatable/equatable.dart';

class MoreOptionsCubitStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class MoreOptionsInitial extends MoreOptionsCubitStates {
  final OptionsItem selectedOption;
  MoreOptionsInitial({required this.selectedOption});
}

class AllAirlinesOptionState extends MoreOptionsCubitStates {
  final OptionsItem selectedOption;
  AllAirlinesOptionState({required this.selectedOption});
}

class FavAirlinesOptionState extends MoreOptionsCubitStates {
  final OptionsItem selectedOption;
  FavAirlinesOptionState({required this.selectedOption});
}
