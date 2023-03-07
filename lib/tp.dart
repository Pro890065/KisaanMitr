import 'dart:io';
import 'package:flutter_graphql/Weather.dart';

import 'package:flutter/material.dart';
import 'login.dart';

class tp extends StatefulWidget {
  const tp({super.key});

  @override
  State<tp> createState() => _tpState();
}

class _tpState extends State<tp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 31, 30, 30),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text("Yay ! You have been succesfully registered !",
                    style: TextStyle(fontSize: 20, color: Colors.white))),
            SizedBox(
              height: 30,
            ),
            Center(
                child: Text("You can now login using phone number and password",
                    style: TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 212, 212, 212)))),
            SizedBox(
              height: 30,
            ),
            Center(
                child: FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            errormessage = 'Enter phone number and password';
                            return const login();
                          },
                        ),
                      );
                    },
                    backgroundColor: Color.fromARGB(255, 12, 12, 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                    label: const Text(' Login ')))
          ],
        )));
  }
}
