import 'package:custom_theme/presentation/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  Widget widgetUnderTest(String errorMessage){
    return MaterialApp(home: ErrorMessage(errorMessage: errorMessage,));
  }

  group('ErrorMessage', () {

    group('shold be display correctly',(){
      testWidgets('when a short text is given', (widgetTester) async{
        const text='a';

        await widgetTester.pumpWidget(widgetUnderTest(text));
        await widgetTester.pumpAndSettle();

        final widgetFinder=find.byType(ErrorMessage);
        expect(widgetFinder, findsOneWidget);

      });
testWidgets('when a long text is given', (widgetTester) async{
        const text='lorem ipsum text, here is a very useful and long text, that has many chars and now i only want to say hello family!';

        await widgetTester.pumpWidget(widgetUnderTest(text));
        await widgetTester.pumpAndSettle();

        final widgetFinder=find.byType(ErrorMessage);
        expect(widgetFinder, findsOneWidget);

      });


    });
   });
}