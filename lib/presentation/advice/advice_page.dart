
import 'package:custom_theme/presentation/reative_login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../application/advice/cubit/advicer_cubit.dart';
import '../../application/theme/theme_service.dart';

import 'widgets/advice_field.dart';

import 'widgets/custome_button.dart';
import 'widgets/error_message.dart';
import 'widgets/moon.dart';
import 'widgets/star.dart';
import 'widgets/sun.dart';

class AdvicePage extends StatelessWidget {
  final AdviceCubit adviceCubit;
  const AdvicePage({Key? key, required this.adviceCubit}) : super(key: key);
  static const routeName='/advicer';

  static const String startText = 'Your Advice is Waiting for you!';
  static const String appbarText = 'Advicer';

  static const String buttonKey = "getAdviceButton";
  static const String loginKey='reative_login';
  static const String progressIndicatorKey = "progressIndicatorKey";
  static const String adviceFieldKey = "adviceFieldKey";
  static const String errorMessageKey = "errorMessageKey";

  @override
  Widget build(BuildContext context) {
   // final adviceCubit = sl<AdvicerCubitCubit>();
    final themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: themeData.scaffoldBackgroundColor,
        appBar: AppBar(
          actions: [
            Switch(
                value: Provider.of<ThemeService>(context).isDarkModeOn,
                onChanged: (_) {
                  Provider.of<ThemeService>(context, listen: false)
                      .toggleTheme();
                })
          ],
          centerTitle: true,
          backgroundColor: themeData.appBarTheme.backgroundColor,
          title: Text(
            appbarText,
            style: themeData.textTheme.displayLarge!
                .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body:  Consumer<ThemeService>(builder: ((context, themeService, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: themeService.isDarkModeOn
                            ? Colors.black.withOpacity(0.7)
                            : Colors.grey,
                        offset: const Offset(0, 5),
                        blurRadius: 10,
                        spreadRadius: 3)
                  ],
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: themeService.isDarkModeOn
                        ? const [
                            Color(0xFF94A9FF),
                            Color(0xFF6B66CC),
                            Color(0xFF200F75),
                          ]
                        : const [
                            Color(0xDDFFFA66),
                            Color(0xDDFFA057),
                            Color(0xDD940B99)
                          ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )),
          child: Stack(
            children: [
              Positioned(
                    top: 70,
                    right: 50,
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: themeService.isDarkModeOn ? 1 : 0,
                        child: const Star()),
                  ),
                  Positioned(
                    top: 150,
                    left: 60,
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: themeService.isDarkModeOn ? 1 : 0,
                        child: const Star()),
                  ),
                  Positioned(
                    top: 40,
                    left: 100,
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: themeService.isDarkModeOn ? 1 : 0,
                        child: const Star()),
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: themeService.isDarkModeOn ? 1 : 0,
                        child: const Star()),
                  ),
                  Positioned(
                    top: 100,
                    right: 200,
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: themeService.isDarkModeOn ? 1 : 0,
                        child: const Star()),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    top: themeService.isDarkModeOn ? 100 : 130,
                    right: themeService.isDarkModeOn ? 100 : -40,
                    child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: themeService.isDarkModeOn ? 1 : 0,
                        child: const Moon()),
                  ),
                  Positioned(
                    top: 120,
                    left: 90,
                    child: AnimatedPadding(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.only(
                            top: themeService.isDarkModeOn ? 110 : 50),
                        child: const Sun()),
                  ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                      margin: const EdgeInsets.only(top: 130),
                      height: MediaQuery.sizeOf(context).height*0.2,
        decoration: BoxDecoration(
            color: themeData.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(15)),
                      child: BlocBuilder<AdviceCubit, AdvicerState>(
                          //BlocBuilder<AdvicerBloc, AdvicerState>(
                          bloc: adviceCubit, //adviceBloc,
                          builder: (context, adviceState) {
                            if (adviceState is AdviceInitial) {
                              return Expanded(
                                child: Center(
                                    child: Text(
                                  startText,
                                  textAlign: TextAlign.center,
                                  style: themeData.textTheme.displayLarge!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              );
                            } else if (adviceState is AdviceLoading) {
                              return Expanded(
                                child: Center(
                                  child: CircularProgressIndicator(
                                      key: const Key(progressIndicatorKey),
                                      color: themeData.colorScheme.secondary),
                                ),
                              );
                            } else if (adviceState is AdviceLoaded) {
                              return Expanded(
                                child: Center(
                                  child: AdviceField(
                                      key: const Key(adviceFieldKey),
                                      adviceText: adviceState.advice.advice),
                                ),
                              );
                            } else if (adviceState is AdviceFailure) {
                              return const Expanded(
                                child: Center(
                                    child: ErrorMessage(errorMessage: 'Ups, there was something going wrong, try again!',
                                  key: Key(errorMessageKey),
                                )),
                              );
                            }
                            return const Placeholder();
                          }),
                    ),
                    const SizedBox(height: 20,),

Text('dddfd ksdjfl sdjfls lksdjfl hlsfla hlsjdfl lsjf',style:TextStyle()),
                    SizedBox(
                        height: 50,
                        child: Center(
                            child: CustomButton(
                          key: const Key(buttonKey),
                          onPressed: () {
                            adviceCubit.getAdvice();
                            // adviceBloc.add(AdviceRequested());
                          },
                          btnText: 'Get Advice',
                        ))),
                          const SizedBox(height: 20,),
                        SizedBox(
                        height: 50,
                        child: Center(
                            child: CustomButton(
                          key: const Key(loginKey),
                          onPressed: () {
                           
                            context.pushNamed(LoginPage.routeName);
                          },
                          btnText: 'Reative Login',
                        )))
                  ],
                ),
              ),
            ],
          ),
        );
        
 })),
   
        );
  }
}