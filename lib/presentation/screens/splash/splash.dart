import 'dart:async';

import 'package:flutter/material.dart';

import 'package:my_flutter_structure/config/app_routes.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void dispose() {
    animationController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController!)
      ..addListener(() {
        // setState(() {});
      });
    animationController!.forward();
    Timer(
        const Duration(seconds: 5),
            () => Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.authPath,
              (Route<dynamic> route) => false,
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation!,
          child: AnimatedBuilder(
            animation: animationController!,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Text("Splash Screen"),
            ),
            builder: (BuildContext context, Widget? widget) {
              return Transform.rotate(
                angle: animationController!.value * 6.3,
                child: widget,
              );
            },
          ),
        ),
      ),
    );
  }
}
