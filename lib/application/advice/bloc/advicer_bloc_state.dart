part of 'advicer_bloc.dart';


abstract class AdvicerBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdvicerInitial extends AdvicerBlocState {}

class AdvicerStateLoading extends AdvicerBlocState {}

class AdvicerStateLoaded extends AdvicerBlocState {
  final String advice; 
  AdvicerStateLoaded({required this.advice});

  @override
  List<Object?> get props => [advice];
}

class AdvicerStateError extends AdvicerBlocState {
  final String message; 
  AdvicerStateError({required this.message});
  @override
  List<Object?> get props => [message];
}