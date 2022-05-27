import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ebook/page/auth_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../util/router.dart';
import '../../views/main_screen.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  startTimeout() {
    {
      Timer(Duration(seconds: 2), handleTimeout);
    }
  }
  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {
    MyRouter.pushPageReplacement(
      context,
      AuthPage()
    );
  }

  @override
  void initState() {
    super.initState();
    startTimeout();
  }

  // Future getValidationData() async {

  //   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var obtainedEmail = sharedPreferences.getString("email");
  //   setState(() {
  //     finalEmail = obtainedEmail;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/app-icon.png",
              height: 300.0,
              width: 300.0,
            ),
          ],
        ),
      ),
    );
  }
}
