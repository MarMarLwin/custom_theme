import 'package:bloc_test/bloc_test.dart';
import 'package:custom_theme/application/advice/bloc/advicer_bloc.dart';
import 'package:custom_theme/application/advice/cubit/advicer_cubit.dart';
import 'package:custom_theme/application/theme/theme_service.dart';
import 'package:custom_theme/domain/usecases/theme_usecase.dart';
import 'package:custom_theme/presentation/advice/advice_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockAdviceCubit extends MockCubit<AdvicerState> implements AdviceCubit {}

// class MockThemeService extends Mock implements ThemeServiceImpl {}

class MockThemeUsecases extends Mock implements ThemeUsecases {}



void main() {
  Widget widgetUnderTest(
      {required AdviceCubit cubit, required ThemeUsecases usecases}) {
    return MaterialApp(
      home: ChangeNotifierProvider(
       
        create: (BuildContext context) =>ThemeServiceImpl(themeUsecases: usecases),
        child: BlocProvider(
          create: (context) => cubit,
          child: AdvicePage(adviceCubit: cubit),
        ),
      ),
    );
  }

  group('AdvicerPage', () {
    late AdviceCubit mockAdviceCubit;
    late ThemeServiceImpl mockThemeService;
    late ThemeUsecases mockThemeUsecases;

    setUp(() {
      mockAdviceCubit = MockAdviceCubit();
      // mockThemeService=MockThemeService();
      mockThemeUsecases=MockThemeUsecases();

    });

    group('should be display in viewstate', () {
      testWidgets('Initial when cubit emit InitialState', (widgetTester) async {
        whenListen(mockAdviceCubit, Stream.fromIterable([AdviceInitial()]),
            initialState: AdvicerInitial());

        await widgetTester.pumpWidget(widgetUnderTest(cubit: mockAdviceCubit, usecases: mockThemeUsecases));
        final widgetFinder=find.text('Your advicer page waiting for you');

        expect(widgetFinder, findsOneWidget);
      });
    });
  });
}
