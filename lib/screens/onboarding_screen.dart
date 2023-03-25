import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen(
      {super.key, required this.backgroundColor, required this.content});

  Color backgroundColor;
  Widget content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Center(
                  child: content,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Text(
                          lorem(paragraphs: 1, words: 3),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          lorem(paragraphs: 1, words: 3),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      lorem(paragraphs: 1, words: 60),
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
