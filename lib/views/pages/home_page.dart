import 'package:flutter/material.dart';
import 'package:practice_3/data/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Image.asset('assets/images/peter.jpg'),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Card(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Tired of Coding ?", style: kTextStyle.titleTealText),
                      Text("See some sexy and juicy flowers !!", style: kTextStyle.descriptionText),
                    ],
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}