import 'package:flutter/material.dart';
import 'package:flutterbook/Start.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  bool animate = false;

  @override
  void initState() {
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 1600),
                width: 100,
                height: 100,
                left: animate ? 350 : 450,
                child: Image.asset("assets/purple.png")),
            AnimatedPositioned(
                duration: Duration(milliseconds: 1600),
                top: animate ? 150 : -300,
                left: 0,
                right: 0,
                child: Image.asset('assets/logo.png')),
            AnimatedPositioned(
                duration: Duration(milliseconds: 2500),
                top: 420,
                right: animate ? 160 : 350,
                child: Text(
                  'By AOM',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.purple[900],
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                )),
            AnimatedPositioned(
                duration: Duration(milliseconds: 1600),
                bottom: 0,
                width: 100,
                height: 100,
                right: animate ? 350 : 450,
                child: Image.asset("assets/purple.png")),
          ],
        ),
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 3000));

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => StartScreen()));
  }
}