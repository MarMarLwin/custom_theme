import 'package:bloc_test/bloc_test.dart';
import 'package:custom_theme/application/advice/cubit/advicer_cubit.dart';
import 'package:custom_theme/core/failures/failures.dart';
import 'package:custom_theme/domain/entities/advicer_entity.dart';
import 'package:custom_theme/domain/usecases/advicer_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAdviceUsecases extends Mock implements AdvicerUsecases {}

void main() {
  group('AdvicerCubit', () {
    group('should emit', () {
      MockAdviceUsecases mockAdviceUsecases = MockAdviceUsecases();
      blocTest('nothing when no method is called',
          build: () => AdviceCubit(adviceUsecases: mockAdviceUsecases),
          expect: () => const <AdvicerState>[]);

      blocTest('[AdviceLoading],[AdviceLoaded] when AdvicerRequest is called',
          setUp: () => when(() => mockAdviceUsecases.getAdviceUsecase())
              .thenAnswer((invocation) => Future.value(
                  Right<Failure, AdviceEntity>(
                      AdviceEntity(advice: 'advice', id: 22)))),
          act: (cubit) => cubit.getAdvice(),
          build: () => AdviceCubit(adviceUsecases: mockAdviceUsecases),
          expect: () => <AdvicerState>[
                AdviceLoading(),
                AdviceLoaded(advice: AdviceEntity(advice: 'advice', id: 22))
              ]);

      group('[AdviceLoading],[AdviceError] when AdvicerRequest is called', () {
        blocTest(
          'and a ServerFailure occours',
          setUp: () => when(() => mockAdviceUsecases.getAdviceUsecase())
              .thenAnswer((invocation) => Future.value(
                  Left<Failure, AdviceEntity>(
                      ServerFailure()))),
          act: (cubit) => cubit.getAdvice(),
          build: () => AdviceCubit(adviceUsecases: mockAdviceUsecases),
          expect: () => <AdvicerState>[
                AdviceLoading(),
                const AdviceFailure(error: 'error')
              ]
        );

        blocTest(
          'and a CacheError occours',
          setUp: () => when(() => mockAdviceUsecases.getAdviceUsecase())
              .thenAnswer((invocation) => Future.value(
                  Left<Failure, AdviceEntity>(
                      CacheFailure()))),
          act: (cubit) => cubit.getAdvice(),
          build: () => AdviceCubit(adviceUsecases: mockAdviceUsecases),
          expect: () => <AdvicerState>[
                AdviceLoading(),
                const AdviceFailure(error: 'error')
              ]
        );

         blocTest(
          'and a GeneralError occours',
          setUp: () => when(() => mockAdviceUsecases.getAdviceUsecase())
              .thenAnswer((invocation) => Future.value(
                  Left<Failure, AdviceEntity>(
                      GeneralFailure()))),
          act: (cubit) => cubit.getAdvice(),
          build: () => AdviceCubit(adviceUsecases: mockAdviceUsecases),
          expect: () => <AdvicerState>[
                AdviceLoading(),
                const AdviceFailure(error: 'error')
              ]
        );
      });
    });
  });
}
