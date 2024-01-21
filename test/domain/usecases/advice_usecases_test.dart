import 'package:custom_theme/core/failures/failures.dart';
import 'package:custom_theme/data/repositories/advice_repository_impl.dart';
import 'package:custom_theme/domain/entities/advicer_entity.dart';
import 'package:custom_theme/domain/usecases/advicer_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advice_usecases_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRepositoryImpl>()])
void main() {
  group('AdviceUsecases', () {
    group('should return AdviceEntity', () {
      test('when AdviceRepoImpl returns a AdviceModel', () async {
        //arrange
        final mockAdviceRepoImpl = MockAdviceRepositoryImpl();
        final adviceUserCaseUnderTest =
            AdvicerUsecases(advicerRepository: mockAdviceRepoImpl);
        when(mockAdviceRepoImpl.getRandomAdviceFromAPI()).thenAnswer(
            (realInvocation) =>
                Future.value(Right(AdviceEntity(id: 42, advice: 'test'))));
        //act
        final result = await adviceUserCaseUnderTest.getAdviceUsecase();
        //assert
        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result,
            Right<Failure, AdviceEntity>(AdviceEntity(id: 42, advice: 'test')));
        verify(mockAdviceRepoImpl.getRandomAdviceFromAPI()).called(1);
        verifyNoMoreInteractions(mockAdviceRepoImpl);
      });
    });

    group('should return left with', () {
      test('a ServerFailure', () async {
//arrange
        final mockAdviceRepoImpl = MockAdviceRepositoryImpl();
        final adviceUserCaseUnderTest =
            AdvicerUsecases(advicerRepository: mockAdviceRepoImpl);
        when(mockAdviceRepoImpl.getRandomAdviceFromAPI()).thenAnswer(
            (realInvocation) => Future.value(Left(ServerFailure())));

        //act
        final result = await adviceUserCaseUnderTest.getAdviceUsecase();

        //assert
        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(ServerFailure()));
        verify(mockAdviceRepoImpl.getRandomAdviceFromAPI()).called(1);
        verifyNoMoreInteractions(mockAdviceRepoImpl);
      });

      test('a GeneralFailure', () async {
//arrange
        final mockAdviceRepoImpl = MockAdviceRepositoryImpl();
        final adviceUserCaseUnderTest =
            AdvicerUsecases(advicerRepository: mockAdviceRepoImpl);
        when(mockAdviceRepoImpl.getRandomAdviceFromAPI()).thenAnswer(
            (realInvocation) => Future.value(Left(GeneralFailure())));

        //act
        final result = await adviceUserCaseUnderTest.getAdviceUsecase();

        //assert
        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(GeneralFailure()));
        verify(mockAdviceRepoImpl.getRandomAdviceFromAPI()).called(1);
        verifyNoMoreInteractions(mockAdviceRepoImpl);
      });
    });
  });
}
