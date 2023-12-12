part of 'advicer_cubit.dart';

abstract class AdvicerState extends Equatable {
  const AdvicerState();

  @override
  List<Object> get props => [];
}

 class AdviceInitial extends AdvicerState {
 
}

class AdviceLoading extends AdvicerState {
 

}
class AdviceLoaded extends AdvicerState {
  final AdviceEntity advice;
  

  const AdviceLoaded({required this.advice});

}

class AdviceFailure extends AdvicerState {
 
}
