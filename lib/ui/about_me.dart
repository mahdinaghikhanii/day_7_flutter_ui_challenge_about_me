import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';

import 'widgets/paint_container.dart';
import 'widgets/start_btn.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

late AnimationController animationController;
late Animation<double> animation;

class _AboutMeState extends State<AboutMe> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 0.7).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF212121),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                height: 435,
                width: double.infinity,
                child: CustomPaint(
                  painter: CirclePainter(animation.value),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          width: 190,
                          height: 190,
                          margin: const EdgeInsets.only(top: 0),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset("assets/image/mahdi.jpg"))),
                      const SizedBox(height: 120)
                    ],
                  ),
                ),
              ),
              ShowUpAnimation(
                delayStart: const Duration(seconds: 1),
                animationDuration: const Duration(seconds: 1),
                curve: Curves.bounceIn,
                direction: Direction.vertical,
                offset: 0.10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                      'Hello, I\'m Mahdi👋, a specialized Flutter developer with +3 years of experience',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          )),
                ),
              ),
              const SizedBox(height: 30),
              ShowUpAnimation(
                delayStart: const Duration(seconds: 1),
                animationDuration: const Duration(seconds: 1),
                curve: Curves.bounceIn,
                direction: Direction.vertical,
                offset: 0.10,
                child: StartButtonWidgets(titleBtn: "ادامه", ontap: () {}),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
