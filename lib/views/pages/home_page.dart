import 'package:flutter/material.dart';
import 'package:practice_3/data/constant.dart';
import 'package:practice_3/views/widgets/container_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      Kvalues.starting,
      Kvalues.concept,
      Kvalues.tricks,
      Kvalues.time,
      Kvalues.flexibility,

    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                child: Text("Know Your Flower Better !",
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 7,
                  ),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center, // You can also use Alignment.bottomCenter or topCenter
              children: [
                // Background image
                ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Optional: rounded corners
                  child: Image.asset(
                    'assets/images/peter.jpg',
                    fit: BoxFit.cover,
                  ),
                ),

                // Text overlay
                Container(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  width: 200,
                  height: 150,
                  alignment: Alignment.bottomRight,
                  child: const Text(
                    '"Tired of Coding ?"',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            ...List.generate(list.length, (index){
                return ContainerWidget(
                    title: list.elementAt(index),
                    description: "You really want the description and details right?");
            })
          ],
        ),
      ),
    );
  }
}