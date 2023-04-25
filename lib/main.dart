import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tag_eyes_app/core/init/theme/tag_eyes_theme.dart';
import 'package:tag_eyes_app/features/bottom_nav_bar/main_view.dart';

import 'features/currency/view/currency_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: TagEyesTheme.defaultTheme,
      home: const LoggedIn(),
    );
  }
}

class LoggedIn extends StatefulWidget {
  const LoggedIn({super.key});

  @override
  State<LoggedIn> createState() => _LoggedInState();
}

bool? _isLoggedIn;

class _LoggedInState extends State<LoggedIn> {
  @override
  void initState() {
    super.initState();
    _getInformation();
  }

  Future<void> _getInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLogin = prefs.getBool('isLogin');
    if (isLogin == false || isLogin == null) {
      setState(() {
        _isLoggedIn = false;
      });
    } else {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (_isLoggedIn) {
      case true:
        return const MainPage();
      case false:
        return const CurrencyPage();
      default:
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
    }
  }
}
