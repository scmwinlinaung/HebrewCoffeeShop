import 'package:flutter/material.dart';
import 'package:mobile/config/app_config.dart';
import 'package:mobile/controller/provider/authentication_provider.dart';
import 'package:mobile/controller/provider/menu_provider.dart';
import 'package:mobile/controller/provider/table_provider.dart';
import 'package:mobile/view/screens/full_screens/home/full_home_screen.dart';
import 'package:mobile/view/screens/full_screens/home/full_login_screen.dart';
import 'package:mobile/view/screens/full_screens/home/full_signup_screen.dart';
import 'package:mobile/view/screens/full_screens/home/splash_screen.dart';
import 'package:mobile/view/screens/full_screens/home/welcome_screen.dart';
import 'package:mobile/view/screens/full_screens/menu/full_menu_screen.dart';
import 'package:mobile/view/screens/full_screens/more/full_more_screen.dart';
import 'package:mobile/view/screens/full_screens/sale/full_sale_screen.dart';
import 'package:mobile/view/screens/full_screens/table/full_table_detail_screen.dart';
import 'package:mobile/view/screens/full_screens/table/full_table_screen.dart';

// Flutter: External Libraries
import 'package:provider/provider.dart';

import 'constant/theme.dart';
import 'controller/provider/theme_provider.dart';

void main() {
  AppConfig appConfig = AppConfig();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(child: MyApp(), providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(
        create: (_) => TableProvider(
            host: appConfig.params['dev']!.host,
            port: appConfig.params['dev']!.port)),
    ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
    ChangeNotifierProvider(create: (_) => MenuProvider())
  ]));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
        title: "RMS",
        debugShowCheckedModeBanner: false,
        themeMode: themeProvider.themeMode,
        theme: ThemeConstant.lightTheme,
        darkTheme: ThemeConstant.darkTheme,
        initialRoute: FullSplashScreen.routeName,
        routes: {
          FullSplashScreen.routeName: (_) => const FullSplashScreen(),
          FullHomeScreen.routeName: (_) => const FullHomeScreen(),
          FullTableScreen.routeName: (_) => const FullTableScreen(),
          FullMenuScreen.routeName: (_) => const FullMenuScreen(),
          FullSaleScreen.routeName: (_) => const FullSaleScreen(),
          FullMoreScreen.routeName: (_) => const FullMoreScreen(),
          FullTableDetailScreen.routeName: (_) => const FullTableDetailScreen(),
          FullLoginScreen.routeName: (_) => const FullLoginScreen(),
          FullSignUpScreen.routeName: (_) => const FullSignUpScreen(),
          FullWelcomeScreen.routeName: (_) => const FullWelcomeScreen(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
