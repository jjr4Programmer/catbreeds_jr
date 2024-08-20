import 'package:catbreeds_app/src/constants.dart';
import 'package:catbreeds_app/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: timeSplash), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const HomeScreen()), // Navegar a la pantalla principal
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white, // Color de fondo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              appTitle,
              style: TextStyle(
                fontSize: size.height * 0.05,
                color: Colors.black,
              ), // Título del splash
            ),
            Gap(size.height * 0.3),
            Image.asset(
              'assets/images/splash.png',
              height: size.height * 0.4,
            ), // Imagen del splash
          ],
        ),
      ),
    );
  }
}
