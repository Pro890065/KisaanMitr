import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'main2.dart';

String errormessage = "Enter phone number and password";
final httpLink = HttpLink("192.168.0.199:8000");

String loginStudent = """

mutation Login(\$loginInput: Login!) {
  login(loginInput: \$loginInput) {
    student {
      crops
      email
    }
    token
    status
  }
}
""";

ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
  cache: GraphQLCache(store: InMemoryStore()),
  link: httpLink,
));

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController t9 = TextEditingController();
  TextEditingController t10 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 30, 30),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 30, 30),
      ),
      body: Mutation(
        options: MutationOptions(
            document: gql(loginStudent),
            update: (GraphQLDataProxy cache, QueryResult? result) {
              return cache;
            },
            onCompleted: (dynamic resultdata) {
              print(resultdata);
              if (resultdata != null) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const First_Page();
                    },
                  ),
                );
              }

              if (resultdata == null) {
                setState(() {
                  errormessage = 'Invalid phone number or password';
                });
              }
            }

            // ignore: void_checks
            // this is the mutation string you just created
            // you can update the cache based on results
            ),
        builder: (
          RunMutation runMutation,
          QueryResult? result,
        ) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Container(
                height: 250,
                width: 300,
                child: Material(
                  color: Color.fromARGB(255, 44, 44, 44),
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          Center(
                              child: Text(errormessage,
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 122, 122, 122)))),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: t9,
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
                            obscureText: true,
                            controller: t10,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 168, 167, 167)),
                            decoration: const InputDecoration(
                              hintText: 'password *',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 168, 167, 167),
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 20),
                          FloatingActionButton.extended(
                              label: const Text("Login"),
                              backgroundColor: Color.fromARGB(255, 12, 12, 12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              onPressed: () {
                                Map<String, dynamic> student = {
                                  "email": t9.text,
                                  "password": t10.text,
                                };
                                print(student);
                                runMutation({"loginInput": student});

                                t9.clear();
                                t10.clear();
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
