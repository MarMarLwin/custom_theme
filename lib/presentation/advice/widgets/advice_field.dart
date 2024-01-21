import 'package:flutter/material.dart';

class AdviceField extends StatelessWidget {
   static String emptyAdvice = "";
  final String adviceText;
  const AdviceField({Key? key, required this.adviceText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        decoration: BoxDecoration(
            color: themeData.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          adviceText.isNotEmpty?'''" $adviceText "''':emptyAdvice,
          textAlign: TextAlign.center,
          style: themeData.textTheme.displayLarge!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}