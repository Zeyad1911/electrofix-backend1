import 'package:app/pages/home_page.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/services/shared_pref_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FutureBuilder(
                future: SharedPrefService().getIsLoggedIn(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final isLoggedIn = snapshot.data!;
                    return isLoggedIn ? HomePage() : LoginPage();
                  } else if (snapshot.hasError) {
                    print("Error checking login status: ${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "asset/logo.png",
              height: 100,
              width: 100,
            ),
            Text(
              "ElectroFix",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
