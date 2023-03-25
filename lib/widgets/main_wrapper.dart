import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onboarding_screen/screens/home_screen.dart';
import 'package:onboarding_screen/screens/onboarding_screen.dart';
import 'package:onboarding_screen/utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          PageView(
            controller: controller,
            children: [
              OnboardingScreen(
                backgroundColor: purpleColor,
                content: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 4,
                      color: Colors.black,
                    ),
                  ),
                  child: VerticalDivider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                ),
              ),
              OnboardingScreen(
                backgroundColor: blueColor,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 90,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                      ),
                    ),
                    Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.emergency,
                      size: 90,
                    ),
                    Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'x',
                      style: TextStyle(
                        fontSize: 120,
                        fontWeight: FontWeight.w200,
                      ),
                    )
                  ],
                ),
              ),
              OnboardingScreen(
                backgroundColor: orageColor,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Transform.rotate(
                      angle: pi / 4,
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.white,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.5, 0.5],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.white,
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [0.5, 0.5],
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: pi / 4,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.white,
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [0.5, 0.5],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: height / 7,
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.black,
                dotColor: Colors.grey.shade600,
                dotWidth: 20,
                dotHeight: 7,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: height / 30),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.page! < 2) {
                      controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                      ;
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(27),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
