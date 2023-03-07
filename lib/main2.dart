import 'dart:io';
import 'package:flutter_graphql/Weather.dart';

import 'package:flutter/material.dart';

int count = 0;
int currindex = 0;
int previndex = 0;

class First_Page extends StatefulWidget {
  const First_Page({super.key});

  @override
  State<First_Page> createState() => First_Page1();
}

class First_Page1 extends State<First_Page> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 30, 30),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 73, 9, 116),
        // automaticallyImplyLeading: false,
        title: Center(child: Text('Farm App', style: TextStyle(fontSize: 30))),
      ),
      body: Center(
        child: Column(children: [
          // Expanded(
          //   flex: 2,
          //   child: Container(
          //     color: Colors.grey[350],
          //     height: 100,
          //     width: double.infinity,
          //     child: Center(child: Text('Weather')),
          //   ),
          // ),
          SizedBox(height: 10, width: double.infinity),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[350],
              height: 100,
              width: double.infinity,
              child: Center(child: Text('Notifications')),
            ),
          ),
          SizedBox(height: 10, width: double.infinity),
          Expanded(
            flex: 5,
            child: Container(
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 150,
                    width: double.infinity,
                    color: Colors.amber[300],
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Center(child: Text('News $index')),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Weather',
            icon: Icon(Icons.cloud),
          ),
          BottomNavigationBarItem(
            label: 'Crop Data',
            icon: Icon(Icons.contact_page),
          )
        ],
        currentIndex: currindex,
        onTap: (int index) {
          setState(() {
            currindex = index;
          });
          Navi(index, context);
        },
      ),
    );
  }
}

class Second_Page extends StatefulWidget {
  const Second_Page({super.key});

  @override
  State<Second_Page> createState() => _Second_PageState();
}

class _Second_PageState extends State<Second_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 31, 30, 30),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 73, 9, 116),
          title: const Text('Weather'),
          centerTitle: true,
        ),
        body: Weather1(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Weather',
              icon: Icon(Icons.cloud),
            ),
            BottomNavigationBarItem(
              label: 'Crop Data',
              icon: Icon(Icons.contact_page),
            )
          ],
          currentIndex: currindex,
          onTap: (int index) {
            setState(() {
              currindex = index;
            });
            Navi(index, context);
          },
        ));
  }
}

class Third_Page extends StatefulWidget {
  const Third_Page({super.key});

  @override
  State<Third_Page> createState() => _Third_PageState();
}

class _Third_PageState extends State<Third_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 31, 30, 30),
        appBar: AppBar(
          title: Text('Rice'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 73, 9, 116),
        ),
        body: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // boxShadow:BoxShadow[

            // ]
          ),
          child: ListView(children: <Widget>[
            Column(
              children: [
                Container(
                  color: Colors.grey,
                  padding: EdgeInsets.all(8),
                  child: Center(
                      child: Text(
                    'Thanjavur/Nagapattinam/Tiruvarur',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                ),
                DataTable(
                  headingRowColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.black),
                  dataRowColor: MaterialStateProperty.resolveWith(
                      (states) => Color.fromARGB(255, 252, 219, 237)),
                  showBottomBorder: true,
                  dataRowHeight: 120,
                  columns: [
                    DataColumn(
                        label: Text('District',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Month',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Varieties',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Kuruvai')),
                      DataCell(Text('Jun-Jul')),
                      DataCell(Container(
                        height: 100,
                        padding: EdgeInsets.all(10),
                        child: Scrollbar(
                          controller: ScrollController(),
                          child: SingleChildScrollView(
                            controller: ScrollController(),
                            child: Text(
                                'ADT 36, ADT 37, ASD 16, ASD 18, MDU 5, IR 50, ADT 43, ADT (R) 45, ADT (R) 47, ADT (R) 48, CO 47, CORH 3'),
                          ),
                        ),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Samba')),
                      DataCell(Text('Aug')),
                      DataCell(Container(
                        height: 100,
                        padding: EdgeInsets.all(4),
                        child: SingleChildScrollView(
                          child: Text(
                              'I.White Ponni, CO 43, CR 1009, ADT 38, TRY 1*, TRY 3*, ADT (R) 44, CORH 4, CO (R) 48,  CO (R) 49, CO (R) 50, ADT (R) 49,TNAU Rice ADT 50, Swarna sub1'),
                        ),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Late Samba/Thaladi')),
                      DataCell(Text('Sep-Oct')),
                      DataCell(Container(
                        height: 100,
                        padding: EdgeInsets.all(4),
                        child: SingleChildScrollView(
                          child: Text(
                              'ADT 38, ADT 39, TRY 1*, TRY 3*, ADT (R) 46, ADT (R) 49, CO (R) 48, CO (R) 49, CO (R) 50'),
                        ),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Navarai')),
                      DataCell(Text('Dec-Jan')),
                      DataCell(Container(
                        height: 100,
                        padding: EdgeInsets.all(4),
                        child: SingleChildScrollView(
                          child: Text(
                              'ADT 36, ADT 37, ASD 16, ASD 18, MDU 5,7,CORH 3'),
                        ),
                      )),
                    ]),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  color: Colors.grey,
                  padding: EdgeInsets.all(8),
                  child: Center(
                      child: Text(
                    'Tiruchirapalli',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                ),
                DataTable(
                  headingRowColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.black),
                  showBottomBorder: true,
                  dataRowHeight: 120,
                  dataRowColor: MaterialStateProperty.resolveWith(
                      (states) => Color.fromARGB(255, 248, 231, 179)),
                  columns: [
                    DataColumn(
                        label: Text('District',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Month',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Varieties',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Kuruvai')),
                      DataCell(Text('Jun-Jul')),
                      DataCell(Container(
                        height: 100,
                        margin: EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          child: Text(
                              'ADT 36, ADT 37, ASD 16, ASD 18, MDU 5, IR 50, ADT 43, ADT (R) 45, ADT (R) 47, ADT (R) 48, CO 47, CORH 3'),
                        ),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Samba')),
                      DataCell(Text('Aug')),
                      DataCell(Container(
                        height: 100,
                        margin: EdgeInsets.all(4),
                        child: SingleChildScrollView(
                          child: Text(
                              'I.White Ponni, CO 43, CR 1009, ADT 38, TRY 1*, TRY 3*, ADT (R) 44, CORH 4, CO (R) 48,  CO (R) 49, CO (R) 50, ADT (R) 49,TNAU Rice ADT 50, Swarna sub1'),
                        ),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Late Samba/Thaladi')),
                      DataCell(Text('Sep-Oct')),
                      DataCell(Container(
                        height: 100,
                        margin: EdgeInsets.all(4),
                        child: SingleChildScrollView(
                          child: Text(
                              'ADT 38, ADT 39, TRY 1*, TRY 3*, ADT (R) 46, ADT (R) 49, CO (R) 48, CO (R) 49, CO (R) 50'),
                        ),
                      )),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('Navarai')),
                      DataCell(Text('Dec-Jan')),
                      DataCell(Container(
                        height: 100,
                        margin: EdgeInsets.all(4),
                        child: SingleChildScrollView(
                          child: Text(
                              'ADT 36, ADT 37, ASD 16, ASD 18, MDU 5,7,CORH 3'),
                        ),
                      )),
                    ]),
                  ],
                ),
              ],
            ),
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Weather',
              icon: Icon(Icons.cloud),
            ),
            BottomNavigationBarItem(
              label: 'Crop Data',
              icon: Icon(Icons.contact_page),
            )
          ],
          currentIndex: currindex,
          onTap: (int index) {
            setState(() {
              currindex = index;
            });
            Navi(index, context);
          },
        ));
  }
}

void Navi(int i, context) {
  if (i == 0)
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const First_Page();
        },
      ),
    );

  if (i == 1)
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const Second_Page();
        },
      ),
    );

  if (i == 2)
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const Third_Page();
        },
      ),
    );
}
