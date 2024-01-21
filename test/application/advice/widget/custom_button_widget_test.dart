import 'package:custom_theme/presentation/advice/widgets/custome_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

abstract class OnCustomButtonTap {
  void call();
}

class MockOnCustomButtonTap extends Mock implements OnCustomButtonTap {}

void main(){
  Widget widgetUnderTest({Function()? callback,String? text}){
    return MaterialApp(
      home:Scaffold(body: CustomButton(onPressed: callback, btnText: text??''),)
    );
  }

  group('CustomButton', () 
  {
    group('is button render correctly',(){
      testWidgets('and has all parts and he needs', (widgetTester) async{

        await widgetTester.pumpWidget(widgetUnderTest(text:'Get Advice'));

        var buttonFinder=find.byType(CustomButton);

        expect(buttonFinder, findsOneWidget);


      });
    });

    group('should handle on Tap',(){
      testWidgets('when someone has pressed on button', (widgetTester)async{
        
        final mockOnCustomButtonTap=MockOnCustomButtonTap();
        await widgetTester.pumpWidget(widgetUnderTest(callback: mockOnCustomButtonTap));
        final buttonFinder= find.byType(CustomButton);

        await widgetTester.tap(buttonFinder);
        verify(mockOnCustomButtonTap).called(1);

      });

    });

   });
}