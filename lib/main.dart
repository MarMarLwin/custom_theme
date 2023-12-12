import 'package:custom_theme/injection.dart';
import 'package:custom_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'application/advice/cubit/advicer_cubit.dart';
import 'application/theme/theme_service.dart';
import 'injection.dart' as di;
import 'presentation/advice/advice_page.dart';

Future initializeApp({required Client client}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(client: client);
  await di.sl<ThemeService>().init();
}

Future<void> main() async {
   await initializeApp(client: Client());
  runApp(const MyAppRoot());
}

class MyAppRoot extends StatelessWidget {
  const MyAppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InjectProviders(
      themeService: di.sl<ThemeService>(),
      child: AppConfig(
        home: AdvicePage(
          adviceCubit: sl<AdviceCubit>(),
        ),
      ),
    );
  }
}

class InjectProviders extends StatelessWidget {
  final Widget child;
  final ThemeService themeService;
  const InjectProviders(
      {Key? key, required this.child, required this.themeService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => themeService, child: child);
  }
}

class AppConfig extends StatelessWidget {
  final Widget home;
  const AppConfig({Key? key, required this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
          title: 'Crypto App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          home: home);
    });
  }
}
