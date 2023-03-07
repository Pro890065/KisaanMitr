import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_graphql/tp.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'sign-up.dart';

import 'package:flutter_graphql/tp.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

final httpLink = HttpLink("192.168.0.199:8000");

dynamic col = Color.fromARGB(255, 31, 30, 30);

String AddStudent = """

mutation Mutation(\$new1: Create!) {
  createStudent(new1: \$new1) {
    name
    id
    email
    crops
  }
}
""";
ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
  cache: GraphQLCache(store: InMemoryStore()),
  link: httpLink,
));

class crop extends StatefulWidget {
  final Key key;
  final ValueChanged<bool> isSelected;
  final String image_url;

  crop({
    required this.isSelected,
    required this.image_url,
    required this.key,
  });

  @override
  State<crop> createState() => _cropState();
}

class _cropState extends State<crop> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: isSelected
                      ? Color.fromARGB(255, 87, 139, 182)
                      : const Color.fromARGB(255, 31, 30, 30),
                  width: 5)),
          height: 150,
          width: 160,
          child: Image.network(widget.image_url, fit: BoxFit.fill)),
    );
  }
}

List selected = [];

List b = [
  "Rice",
  "wheat",
  "jowar",
  "bajra",
  "ragi",
  "maize",
  "coconut",
  "millet",
  "cotton",
  "sugarcane"
];
List a = [
  "https://m.economictimes.com/thumb/msid-93881796,width-1200,height-900,resizemode-4,imgsize-154184/after-wheat-and-sugar-govt-may-curb-rice-exports.jpg",

  "http://www.kayawell.com/Data/UserContentImg/2018/3/183ac9a5-fa43-4ac1-90b2-f8b54c7b82b0.jpg",

  "https://i0.wp.com/florafoods.in/wp-content/uploads/2019/07/JOLA-4.png?fit=375%2C281&ssl=1",
  //jowar

  "https://post.healthline.com/wp-content/uploads/2020/10/bajra-pearl-millet-grain-1200x628-facebook-1200x628.jpg",
  //bajra

  "https://m.media-amazon.com/images/I/51wy7m+ZLOS.jpg",
  //ragi

  "https://www.mccormick.it/wp-content/uploads/2020/05/dati-aggiornati-sulla-produzione-di-mais-nel-mondo-853x480.jpg",
  //maize

  "https://www.herbazest.com/imgs/7/6/3/17328/coconut.jpg",

  //coconut

  "https://cdn.shopify.com/s/files/1/0017/9234/4153/products/kodo_millets_600x.jpg?v=1562698026",
  //millet

  "https://images.ctfassets.net/3s5io6mnxfqz/4TV7YTCO1DJuMhhn7RD1Ol/b5a6c12340e6529a86bc1b557ed2d8f8/AdobeStock_136921602.jpeg",

  //cotton

  "https://www.saveur.com/uploads/2022/03/05/sugarcane-linda-xiao.jpg?auto=webp",
  //sugarcane
];

int l = 5;

class Crop_selection extends StatefulWidget {
  const Crop_selection({super.key});

  @override
  State<Crop_selection> createState() => _Crop_selectionState();
}

class _Crop_selectionState extends State<Crop_selection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 31, 30, 30),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 31, 30, 30),
        ),
        body: Column(children: [
          Expanded(
              flex: 1,
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Select crops",
                          style:
                              TextStyle(fontSize: 25, color: Colors.white))))),
          Expanded(
            flex: 4,
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: ((context, index) => Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10.0, 5, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          crop(
                            image_url: a[2 * index],
                            isSelected: (bool value) {
                              setState(() {
                                if (value) {
                                  selected.add(b[2 * index]);
                                } else {
                                  selected.remove(b[2 * index]);
                                }
                              });
                            },
                            key: Key(a[index].toString()),
                          ),
                          SizedBox(width: 25),
                          crop(
                            image_url: a[2 * index + 1],
                            isSelected: (bool value) {
                              setState(() {
                                if (value) {
                                  selected.add(b[2 * index + 1]);
                                } else {
                                  selected.remove(b[2 * index + 1]);
                                }
                              });
                            },
                            key: Key(a[2 * index + 1].toString()),
                          )
                        ],
                      ),
                    ))),
          ),
          SizedBox(height: 20),
          Mutation(
            options: MutationOptions(
              document: gql(AddStudent),
              update: (GraphQLDataProxy cache, QueryResult? result) {
                return cache;
              },

              // ignore: void_checks
              // this is the mutation string you just created
              // you can update the cache based on results
            ),
            builder: (
              RunMutation runMutation,
              QueryResult? result,
            ) {
              return FloatingActionButton.extended(
                  label: const Text("Sign-up"),
                  backgroundColor: Color.fromARGB(255, 12, 12, 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  onPressed: () {
                    Map<String, dynamic> student = {
                      "name": t1.text,
                      "email": t2.text,
                      "password": t3.text,
                      "crops": selected,
                    };

                    runMutation({"new1": student});
                    print(t1.text);
                    t1.clear();
                    t2.clear();
                    t3.clear();
                    t8.clear();
                    print(result);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const tp();
                      },
                    ));
                  });
            },
          ),
          SizedBox(height: 20)
        ]));
  }
}
