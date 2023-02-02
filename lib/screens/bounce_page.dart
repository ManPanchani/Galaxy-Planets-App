import 'dart:math';
import 'package:flutter/material.dart';
import 'global.dart';

class GalaxyBounce extends StatefulWidget {
  const GalaxyBounce({Key? key}) : super(key: key);

  @override
  State<GalaxyBounce> createState() => _GalaxyBounceState();
}

class _GalaxyBounceState extends State<GalaxyBounce> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          Global.select.name,
        ),
        centerTitle: true,
        flexibleSpace: Container(
          height: h,
          width: w,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "images/saurmandal.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Container(
        height: h,
        width: w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "images/brahmand.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            TweenAnimationBuilder(
              curve: Curves.bounceOut,
              tween: Tween(
                begin: const Offset(-100, -100),
                end: const Offset(0, 550),
              ),
              duration: const Duration(seconds: 10),
              builder: (context, Offset position, widget) {
                return Transform.translate(
                  offset: position,
                  child: TweenAnimationBuilder(
                    curve: Curves.bounceOut,
                    tween: Tween<double>(begin: 0, end: pi * 2),
                    duration: const Duration(seconds: 10),
                    builder: (context, double degree, widget) {
                      return Transform.rotate(
                        angle: degree,
                        child: widget,
                      );
                    },
                    child: Image(
                      image: AssetImage(
                        Global.select.image,
                      ),
                      height: 170,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
