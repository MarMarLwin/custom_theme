import 'package:dartz/dartz.dart';

import '../../core/failures/failures.dart';

import '../entities/advicer_entity.dart';
import '../repositories/advice/advice_repository.dart';

class AdvicerUsecases {
  final AdviceRepository advicerRepository;
  AdvicerUsecases({required this.advicerRepository});


  Future<Either<Failure, AdviceEntity>> getAdviceUsecase() async {
    // call function from repository to get advice
    return advicerRepository.getRandomAdviceFromAPI();

    // Buisness logic implemention
  }
}