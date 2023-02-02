import 'package:flutter/material.dart';
import 'package:galaxy_planets_app/screens/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      // duration: const Duration(seconds: 2),
    );

    animationController.repeat(
      reverse: true,
      period: const Duration(seconds: 15),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Galaxy Planets",
        ),
        centerTitle: true,
        flexibleSpace: Container(
          height: h * 0.5,
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
        child: ListView.builder(
          itemCount: Global.planet.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Global.select = Global.planet[i];

                      Navigator.of(context).pushNamed("DetailsPage");
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: h * 0.25,
                      width: w,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadiusDirectional.circular(20),
                        border: Border.all(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RotationTransition(
                            turns: animationController,
                            child: Hero(
                              tag: Global.planet[i].name,
                              child: Image(
                                image: AssetImage(
                                  Global.planet[i].image,
                                ),
                                height: 150,
                              ),
                            ),
                          ),
                          Text(
                            Global.planet[i].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 34,
                              color: Colors.black,
                              fontFamily: ('Crimson'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
