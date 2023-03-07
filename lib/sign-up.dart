import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_graphql/crop_selection.dart';
import 'package:flutter_graphql/tp.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final httpLink = HttpLink("192.168.0.199:8000");
var confirmPass;

TextEditingController t1 = TextEditingController();
TextEditingController t2 = TextEditingController();
TextEditingController t3 = TextEditingController();

TextEditingController t8 = TextEditingController();

ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
  cache: GraphQLCache(store: InMemoryStore()),
  link: httpLink,
));
final _formKey = GlobalKey<FormState>();

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 31, 30, 30),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 31, 30, 30),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Container(
                height: 400,
                width: 350,
                child: Material(
                  color: Color.fromARGB(255, 44, 44, 44),
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: t1,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter name";
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 168, 167, 167)),
                              decoration: const InputDecoration(
                                hintText: 'Name *',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 168, 167, 167),
                                    fontSize: 15),
                              ),
                            ),
                            TextFormField(
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please enter phone number";
                                } else if (value.length != 10) {
                                  return "Invalid phone number";
                                } else {
                                  return null;
                                }
                              },
                              controller: t2,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 168, 167, 167)),
                              decoration: const InputDecoration(
                                hintText: 'Phone number *',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 168, 167, 167),
                                    fontSize: 15),
                              ),
                            ),
                            TextFormField(
                              validator: (String? value) {
                                confirmPass = value;
                                if (value!.isEmpty) {
                                  return "Please Enter New Password";
                                } else if (value.length < 8) {
                                  return "Password must be atleast 8 characters long";
                                } else
                                  return null;
                              },
                              obscureText: true,
                              controller: t3,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 168, 167, 167)),
                              decoration: const InputDecoration(
                                hintText: 'password *',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 168, 167, 167),
                                    fontSize: 15),
                              ),
                            ),
                            TextFormField(
                              obscureText: true,
                              controller: t8,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Please Re-Enter New Password";
                                } else if (value.length < 8) {
                                  return "Password must be atleast 8 characters long";
                                } else if (value != confirmPass) {
                                  return "Password must be same as above";
                                } else {
                                  return null;
                                }
                              },
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 168, 167, 167)),
                              decoration: const InputDecoration(
                                hintText: 'Re-enter password *',
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 168, 167, 167),
                                    fontSize: 15),
                              ),
                            ),
                            FloatingActionButton.extended(
                              label: const Text("Next"),
                              backgroundColor: Color.fromARGB(255, 12, 12, 12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              onPressed: () {
                                if (_formKey.currentState!.validate())
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return const Crop_selection();
                                    },
                                  ));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
