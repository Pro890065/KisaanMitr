import 'package:flutter_graphql/small_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

int temp = 18;

class Weather1 extends StatefulWidget {
  const Weather1({super.key});

  @override
  State<Weather1> createState() => _WeatherState();
}

class _WeatherState extends State<Weather1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 10,
          shadowColor: Colors.grey,
          child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                // image: DecorationImage(
                //     // image: AssetImage("assets/sky.webp"),
                //     image: AssetImage("assets/288-2883514_android-night.jpg"),
                //     // image: AssetImage("assets/rainy_night.jpg"),
                //     // image: AssetImage("assets/rainy.jpg"),
                //     fit: BoxFit.cover,
                //     opacity: 0.6),

                color: Color.fromARGB(255, 1, 3, 20).withOpacity(0.9),
                // color: Color.fromARGB(255, 30, 167, 247),
                borderRadius: BorderRadius.circular(10),
                // boxShadow: [
                //   BoxShadow(
                //     color: Color.fromARGB(255, 107, 107, 107),
                //     spreadRadius: 2,
                //     blurRadius: 5,
                //   ),
                // ]
              ),

              //Start here
              child: Column(children: [
                //location
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text('Chennai',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 241, 240, 240),
                                  fontSize: 20))),
                    )),
                Divider(
                  height: 5,
                  // color: Color.fromARGB(255, 170, 169, 169),
                  color: Color.fromARGB(255, 255, 253, 253),
                  thickness: 1.5,
                  indent: 50,
                  endIndent: 50,
                ),

                //Icon

                Expanded(
                  flex: 2,
                  child: Center(
                      child: Icon(Icons.cloud,
                          color: Color.fromARGB(255, 238, 237, 237),
                          // Icons.sunny,
                          // color: Colors.yellow,
                          size: 100,
                          shadows: [
                        Shadow(
                            // color: Color.fromARGB(255, 37, 37, 37),
                            color: Colors.white,
                            blurRadius: 7),
                        Shadow(
                            color: Color.fromARGB(255, 104, 104, 104),
                            blurRadius: 15),
                        Shadow(
                            // color: Color.fromARGB(255, 61, 59, 59),
                            color: Colors.white,
                            blurRadius: 20),
                        Shadow(
                            color: Color.fromARGB(255, 160, 159, 159),
                            blurRadius: 25)
                      ])),
                ),

                //Temperature

                Expanded(
                    flex: 1,
                    child: Center(
                        child: Text('26 °C',
                            style: TextStyle(
                                color: Color.fromARGB(255, 250, 248, 248),
                                fontSize: 40,
                                fontWeight: FontWeight.w700)))),

                //One word description of weather

                Expanded(
                    flex: 1,
                    child: Center(
                        child: Text('Cloudy',
                            style: TextStyle(
                                color: Color.fromARGB(255, 245, 242, 242),
                                fontSize: 25,
                                fontWeight: FontWeight.w500)))),
                Divider(
                  height: 5,
                  color: Color.fromARGB(255, 212, 211, 211),
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),

                // Precipitation , wind speeds and humidity

                Expanded(
                    flex: 2,
                    child: Row(children: [
                      // Precipitation

                      Expanded(
                        flex: 1,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text('80%',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 253, 253),
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(height: 5),
                              Center(
                                child: Text('Precipitation',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 223, 222, 222),
                                      fontSize: 18,
                                    )),
                              ),
                            ]),
                      ),

                      // Humidity

                      Expanded(
                        flex: 1,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text('80',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 253, 253),
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(height: 5),
                              Center(
                                child: Text('Humidity',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 223, 222, 222),
                                      fontSize: 18,
                                    )),
                              ),
                            ]),
                      ),

                      //windspeeds

                      Expanded(
                        flex: 1,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                child: Text('13mph',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 253, 253),
                                        fontSize: 23,
                                        fontWeight: FontWeight.w500)),
                              ),
                              SizedBox(height: 5),
                              Center(
                                child: Text('Windspeed',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 223, 222, 222),
                                      fontSize: 18,
                                    )),
                              ),
                            ]),
                      )
                    ])),

                // Small widgets for showing future weather

                Expanded(
                  flex: 3,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 0, 5, 10),
                      child:
                          ListView(scrollDirection: Axis.horizontal, children: [
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                //time

                                Center(
                                  child: Text('8:00 pm',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),

                                //Weather details

                                Container(
                                    height: 100,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 222, 222, 224)
                                          .withOpacity(0.6),
                                      // color: Color.fromARGB(255, 30, 167, 247),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      children: [
                                        //Icon

                                        Expanded(
                                          flex: 2,
                                          child: Center(
                                              child: Icon(Icons.thunderstorm,
                                                  color: Color.fromARGB(
                                                      255, 3, 17, 146),
                                                  // Icons.sunny,
                                                  // color: Colors.yellow,
                                                  size: 40,
                                                  shadows: [
                                                Shadow(
                                                    // color: Color.fromARGB(255, 37, 37, 37),
                                                    color: Colors.white,
                                                    blurRadius: 1),
                                                Shadow(
                                                    color: Color.fromARGB(
                                                        255, 104, 104, 104),
                                                    blurRadius: 2),
                                                Shadow(
                                                    // color: Color.fromARGB(255, 61, 59, 59),
                                                    color: Colors.white,
                                                    blurRadius: 3),
                                                Shadow(
                                                    color: Color.fromARGB(
                                                        255, 160, 159, 159),
                                                    blurRadius: 4)
                                              ])),
                                        ),

                                        //Temperature

                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                                child: Text('25 °C',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 12, 12, 12),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w700)))),

                                        //One word description of weather

                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                                child: Text('Rain',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 15, 15, 15),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500)))),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                //time

                                Center(
                                  child: Text('11:00 pm',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),

                                //Weather details

                                Container(
                                    height: 100,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 222, 222, 224)
                                          .withOpacity(0.6),
                                      // color: Color.fromARGB(255, 30, 167, 247),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      children: [
                                        //Icon

                                        Expanded(
                                          flex: 2,
                                          child: Center(
                                              child: Icon(Icons.thunderstorm,
                                                  color: Color.fromARGB(
                                                      255, 3, 17, 146),
                                                  // Icons.sunny,
                                                  // color: Colors.yellow,
                                                  size: 40,
                                                  shadows: [
                                                Shadow(
                                                    // color: Color.fromARGB(255, 37, 37, 37),
                                                    color: Colors.white,
                                                    blurRadius: 1),
                                                Shadow(
                                                    color: Color.fromARGB(
                                                        255, 104, 104, 104),
                                                    blurRadius: 2),
                                                Shadow(
                                                    // color: Color.fromARGB(255, 61, 59, 59),
                                                    color: Colors.white,
                                                    blurRadius: 3),
                                                Shadow(
                                                    color: Color.fromARGB(
                                                        255, 160, 159, 159),
                                                    blurRadius: 4)
                                              ])),
                                        ),

                                        //Temperature

                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                                child: Text('25 °C',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 12, 12, 12),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w700)))),

                                        //One word description of weather

                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                                child: Text('Rain',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 15, 15, 15),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500)))),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                //time

                                Center(
                                  child: Text('2:00 am',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),

                                //Weather details

                                Container(
                                    height: 100,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 222, 222, 224)
                                          .withOpacity(0.6),
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
                                                  color: Color.fromARGB(
                                                      255, 3, 17, 146),
                                                  // Icons.sunny,
                                                  // color: Colors.yellow,
                                                  size: 35,
                                                  shadows: [
                                                Shadow(
                                                    // color: Color.fromARGB(255, 37, 37, 37),
                                                    color: Colors.white,
                                                    blurRadius: 1),
                                                Shadow(
                                                    color: Color.fromARGB(
                                                        255, 104, 104, 104),
                                                    blurRadius: 2),
                                                Shadow(
                                                    // color: Color.fromARGB(255, 61, 59, 59),
                                                    color: Colors.white,
                                                    blurRadius: 3),
                                                Shadow(
                                                    color: Color.fromARGB(
                                                        255, 160, 159, 159),
                                                    blurRadius: 4)
                                              ])),
                                        ),

                                        //Temperature

                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                                child: Text('27 °C',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 12, 12, 12),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w700)))),

                                        //One word description of weather

                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                                child: Text('Cloudy',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 15, 15, 15),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500)))),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                //time

                                Center(
                                  child: Text('5:00 am',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),

                                //Weather details

                                Container(
                                    height: 100,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 222, 222, 224)
                                          .withOpacity(0.6),
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
                                                  color: Color.fromARGB(
                                                      255, 3, 17, 146),
                                                  // Icons.sunny,
                                                  // color: Colors.yellow,
                                                  size: 35,
                                                  shadows: [
                                                Shadow(
                                                    // color: Color.fromARGB(255, 37, 37, 37),
                                                    color: Colors.white,
                                                    blurRadius: 1),
                                                Shadow(
                                                    color: Color.fromARGB(
                                                        255, 104, 104, 104),
                                                    blurRadius: 2),
                                                Shadow(
                                                    // color: Color.fromARGB(255, 61, 59, 59),
                                                    color: Colors.white,
                                                    blurRadius: 3),
                                                Shadow(
                                                    color: Color.fromARGB(
                                                        255, 160, 159, 159),
                                                    blurRadius: 4)
                                              ])),
                                        ),

                                        //Temperature

                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                                child: Text('28 °C',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 12, 12, 12),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w700)))),

                                        //One word description of weather

                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                                child: Text('Cloudy',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 15, 15, 15),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500)))),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                //time

                                Center(
                                  child: Text('8:00 am',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ),
                                SizedBox(
                                  height: 5,
                                ),

                                //Weather details

                                Container(
                                    height: 100,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 222, 222, 224)
                                          .withOpacity(0.6),
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
                                                  color: Color.fromARGB(
                                                      255, 3, 17, 146),
                                                  // Icons.sunny,
                                                  // color: Colors.yellow,
                                                  size: 35,
                                                  shadows: [
                                                Shadow(
                                                    // color: Color.fromARGB(255, 37, 37, 37),
                                                    color: Colors.white,
                                                    blurRadius: 1),
                                                Shadow(
                                                    color: Color.fromARGB(
                                                        255, 104, 104, 104),
                                                    blurRadius: 2),
                                                Shadow(
                                                    // color: Color.fromARGB(255, 61, 59, 59),
                                                    color: Colors.white,
                                                    blurRadius: 3),
                                                Shadow(
                                                    color: Color.fromARGB(
                                                        255, 160, 159, 159),
                                                    blurRadius: 4)
                                              ])),
                                        ),

                                        //Temperature

                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                                child: Text('28 °C',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 12, 12, 12),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w700)))),

                                        //One word description of weather

                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                                child: Text('Cloudy',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 15, 15, 15),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500)))),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        )
                      ])
                      // child: ListView.builder(
                      //     shrinkWrap: true,
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: 10,
                      //     itemBuilder: (BuildContext context, int index) {
                      //       return small_widget();
                      //     }),
                      ),
                )
              ])),
        ));
  }
}
