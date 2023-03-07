import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_graphql/login.dart';
import 'package:flutter_graphql/sign-up.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'main2.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

String errormessage = "Enter phone number and password";

final httpLink = HttpLink("192.168.0.199:8000");

TextEditingController t9 = TextEditingController();
TextEditingController t10 = TextEditingController();

ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
  cache: GraphQLCache(store: InMemoryStore()),
  link: httpLink,
));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          backgroundColor: Colors.black,
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Sign-Up'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 31, 30, 30),

        // appBar: AppBar(
        //   // Here we take the value from the MyHomePage object that was created by
        //   // the App.build method, and use it to set our appbar title.
        //   title: Text(widget.title),
        // ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fleaves%2F&psig=AOvVaw02SYi_L_aHk6attf-VFAAs&ust=1674661924224000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCLC6ifzH4PwCFQAAAAAdAAAAABAD"))),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Farm App",
                  style: TextStyle(color: Colors.white, fontSize: 50)),
              SizedBox(height: 200),
              Center(
                  child: Text("Existing user ?",
                      style: TextStyle(color: Colors.white, fontSize: 20))),
              SizedBox(height: 20),
              Center(
                  child: FloatingActionButton.extended(
                      heroTag: 'n',
                      label: const Text("Login"),
                      backgroundColor: Color.fromARGB(255, 12, 12, 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              errormessage = 'Enter phone number and password';
                              return const login();
                            },
                          ),
                        );
                      })),
              SizedBox(height: 20),
              Center(
                  child: Text("First time user?",
                      style: TextStyle(color: Colors.white, fontSize: 20))),
              SizedBox(height: 20),
              Center(
                  child: FloatingActionButton.extended(
                      heroTag: 'm',
                      label: const Text("Sign-up"),
                      backgroundColor: Color.fromARGB(255, 12, 12, 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const Signup();
                            },
                          ),
                        );
                      }))
            ],
          )),
        ));
  }
}
