import 'package:dartz/dartz.dart';

import '../../../core/failures/failures.dart';
import '../../entities/advicer_entity.dart';

abstract class AdviceRepository {
  Future<Either<Failure, AdviceEntity>> getRandomAdviceFromAPI();
}