import 'package:custom_theme/core/exceptions/exceptions.dart';
import 'package:custom_theme/core/failures/failures.dart';
import 'package:custom_theme/data/datasources/advice_remote_datasource.dart';
import 'package:custom_theme/data/models/advice_model.dart';
import 'package:custom_theme/data/repositories/advice_repository_impl.dart';
import 'package:custom_theme/domain/entities/advicer_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advice_repo_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRemoteDatasourceImplementation>()])
void main() {
  group('AdviceRepoImpl', () {
    group('should return AdviceEntity', () {
      test('when AdviceRemoteDatasource returns AdviceModel', () async {
        final mockAdviceRemoteDatasource =
            MockAdviceRemoteDatasourceImplementation();
        final adviceRepoImplUnderTest = AdviceRepositoryImpl(
            adviceRemoteDatasource: mockAdviceRemoteDatasource);

        when(mockAdviceRemoteDatasource.getRandomAdviceFromAPI()).thenAnswer(
            (realInvocation) =>
                Future.value(AdviceModel(advice: 'test', id: 42)));

        final result = await adviceRepoImplUnderTest.getRandomAdviceFromAPI();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result,
            Right<Failure, AdviceModel>(AdviceModel(advice: 'test', id: 42)));
        verify(mockAdviceRemoteDatasource.getRandomAdviceFromAPI()).called(1);
        verifyNoMoreInteractions(mockAdviceRemoteDatasource);
      });
    });

    group('should return left with', () {
      test('a ServerFailure when a ServerException occurs', () async {
        final mockAdviceRemoteDatasource =
            MockAdviceRemoteDatasourceImplementation();
        final adviceRepoImplUnderTest = AdviceRepositoryImpl(
            adviceRemoteDatasource: mockAdviceRemoteDatasource);

        when(mockAdviceRemoteDatasource.getRandomAdviceFromAPI())
            .thenThrow(ServerException());

        final result = await adviceRepoImplUnderTest.getRandomAdviceFromAPI();
        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(ServerFailure()));
      });

      test('general fail on all other Exceptions',() async {
         final mockAdviceRemoteDatasource =
            MockAdviceRemoteDatasourceImplementation();
        final adviceRepoImplUnderTest = AdviceRepositoryImpl(
            adviceRemoteDatasource: mockAdviceRemoteDatasource);
         when(mockAdviceRemoteDatasource.getRandomAdviceFromAPI())
            .thenThrow(ServerException());

        final result = await adviceRepoImplUnderTest.getRandomAdviceFromAPI();
        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(ServerFailure()));

      });
    });
  });
}
