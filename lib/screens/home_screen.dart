import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../data/database_new.dart';
import 'add_prodect.dart';
import 'item_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SqlDb db = SqlDb();

  Future<List<Map>> readData() async {
    List<Map> response = await db.readData("SELECT * FROM notes2");
    return response;
  }

  Map reasflaksfh = {
    //key      values
    'HUSSEN': "apsfo;j aspofsf asfo naosfl"
  };
  // Future<List<String>> readDataSQL(String sql) async {
  //   List<String> response = await db.readData("SELECT $sql FROM notes2");
  //   return response;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 171, 187),
      appBar: AppBar(
          title: const Text(
            'HomeScreen',
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 15, 189, 189)),
      body: FutureBuilder(
          future: readData(),
          builder: ((BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  addAutomaticKeepAlives: false,
                  cacheExtent: 300,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, index) => ClipRRect(
                        child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black38,
                                ),
                                color: Color.fromARGB(137, 228, 223, 223)),
                            child: InkWell(
                              highlightColor: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ItemScreens(indexData: index),
                              )),
                              child: Column(
                                children: [
                                  Container(
                                      width: double.infinity,
                                      height: 240,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/17.jpg',
                                              ),
                                              fit: BoxFit.fill))),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        '${snapshot.data![index]['nameprodect']}',
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600)),
                                    // Text(
                                    //     'عدد العناصر\n      ${snapshot.data![index]['salaryItem']}',
                                    //     style: TextStyle(fontSize: 20)),
                                    // Text(
                                    //     ' عدد الكراتين\n       ${snapshot.data![index]['conter']}',
                                    //     style: TextStyle(fontSize: 17)),
                                  )
                                ],
                              ),
                            )),
                      ));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          })),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddProdect(),
            ));
          },
          child: const Icon(Icons.add)),
    );
  }
}
