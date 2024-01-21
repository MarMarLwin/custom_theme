import 'package:bloc_test/bloc_test.dart';
import 'package:custom_theme/application/advice/bloc/advicer_bloc.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  // await initializeApp(client: Client());
  group('AdvicerBloc', () {
    group('should emits', ()  {
      // await initializeApp(client: Client());
      blocTest<AdvicerBloc, AdvicerBlocState>('nothing when no event is added',
          build: () => AdvicerBloc(),
          expect: () => const <AdvicerBlocState>[]);

      blocTest<AdvicerBloc, AdvicerBlocState>(
          '[AdvicerStateLoading, AdvicerStateError] when AdviceRequestedEvent is added',
          build: () => AdvicerBloc(),
          act: (bloc) => bloc.add(AdviceRequestedEvent()),
          wait: const Duration(seconds: 3),
          expect: () => <AdvicerBlocState>[AdvicerStateLoading(), AdvicerStateError(message: 'error message')]);
    });
  });
}

