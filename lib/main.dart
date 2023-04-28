import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tag_eyes_app/core/init/theme/tag_eyes_theme.dart';
import 'package:tag_eyes_app/features/bottom_nav_bar/main_view.dart';
import 'package:tag_eyes_app/features/product/view/product_page.dart';
import 'package:tag_eyes_app/model/user_model.dart';

import 'features/currency/view/currency_view.dart';

void main() {
  runApp(const MyApp());
}

SharedPreferences? prefs;
late UserModel userModel;

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
    prefs = await SharedPreferences.getInstance();
    bool? isLogin = prefs?.getBool('isLogin');
    if (isLogin == false || isLogin == null) {
      setState(() {
        _isLoggedIn = false;
      });
    } else {
      userModel = UserModel(
        curr1: prefs!.getString('firstCurr')!,
        curr2: prefs!.getString('secondCurr')!,
        email: prefs!.getString('email')!,
        fullName: prefs!.getString('fullName')!,
      );
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String barcode = 'productName-10-USD-productDescription';
    // switch (_isLoggedIn) {
    //   case true:
    //     return ProductPage(barcode: barcode);
    //   case false:
    //     return const CurrencyPage();
    //   default:
    //     return const Scaffold(
    //       body: Center(
    //         child: CircularProgressIndicator(),
    //       ),
    //     );
    // }
    // return ProductPage(barcode: barcode);
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
