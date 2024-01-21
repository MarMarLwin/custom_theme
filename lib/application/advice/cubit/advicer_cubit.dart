import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/advicer_entity.dart';
import '../../../domain/usecases/advicer_usecase.dart';

part 'advicer_state.dart';

class AdviceCubit extends Cubit<AdvicerState> {
  final AdvicerUsecases adviceUsecases;

  AdviceCubit({required this.adviceUsecases})
      : super(AdviceInitial());



  Future<void> getAdvice() async {
    emit(AdviceLoading());

    final adviceOrFailure = await adviceUsecases.getAdviceUsecase();

    emit(adviceOrFailure.fold((failure) => const AdviceFailure(error: 'error'),
        (advice) => AdviceLoaded(advice: advice)));
  }
}
