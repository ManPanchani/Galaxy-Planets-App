import 'dart:math';

import 'package:flutter/material.dart';
import 'package:galaxy_planets_app/screens/global.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
    );

    animationController.repeat(
      period: const Duration(seconds: 15),
    );
  }

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
      body: Center(
        child: Container(
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
              SizedBox(
                height: h * 0.03,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.of(context).pushNamed("GalaxyBounce");
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: h * 0.3,
                    width: w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      border: Border.all(
                        width: 2,
                      ),
                      borderRadius: BorderRadiusDirectional.circular(30),
                    ),
                    child: RotationTransition(
                      turns: animationController,
                      child: Image(
                        image: AssetImage(
                          Global.select.image,
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.001,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  alignment: Alignment.center,
                  height: h * 0.1,
                  width: w,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    border: Border.all(
                      width: 2,
                    ),
                    borderRadius: BorderRadiusDirectional.circular(30),
                  ),
                  child: Text(
                    Global.select.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.black,
                      fontFamily: ('Crimson'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.001,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.topCenter,
                    height: h * 0.38,
                    width: w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      border: Border.all(
                        width: 2,
                      ),
                      borderRadius: BorderRadiusDirectional.circular(30),
                    ),
                    child: Text(
                      Global.select.description,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.black,
                        fontFamily: 'Crimson',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
