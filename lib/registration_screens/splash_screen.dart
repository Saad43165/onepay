import 'package:flutter/material.dart';

import 'my_home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);


    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Image.asset(
            "assets/img/splash.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
