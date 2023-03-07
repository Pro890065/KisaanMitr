import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'Weather.dart';

class small_widget extends StatefulWidget {
  const small_widget({super.key});

  @override
  State<small_widget> createState() => _small_widgetState();
}

class _small_widgetState extends State<small_widget> {
  @override
  Widget build(BuildContext context) {
    // small widgets clickable
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            //time

            Center(
              child: Text('5:00 am',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
            ),
            SizedBox(
              height: 5,
            ),

            //Weather details

            Container(
                height: 100,
                width: 80,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 222, 222, 224).withOpacity(0.6),
                  // color: Color.fromARGB(255, 30, 167, 247),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    //Icon

                    Expanded(
                      flex: 2,
                      child: Center(
                          child: Icon(Icons.cloud,
                              color: Color.fromARGB(255, 3, 17, 146),
                              // Icons.sunny,
                              // color: Colors.yellow,
                              size: 40,
                              shadows: [
                            Shadow(
                                // color: Color.fromARGB(255, 37, 37, 37),
                                color: Colors.white,
                                blurRadius: 1),
                            Shadow(
                                color: Color.fromARGB(255, 104, 104, 104),
                                blurRadius: 2),
                            Shadow(
                                // color: Color.fromARGB(255, 61, 59, 59),
                                color: Colors.white,
                                blurRadius: 3),
                            Shadow(
                                color: Color.fromARGB(255, 160, 159, 159),
                                blurRadius: 4)
                          ])),
                    ),

                    //Temperature

                    Expanded(
                        flex: 1,
                        child: Center(
                            child: Text('19 °C',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 12, 12, 12),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700)))),

                    //One word description of weather

                    Expanded(
                        flex: 1,
                        child: Center(
                            child: Text('Cloudy',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 15, 15, 15),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)))),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
