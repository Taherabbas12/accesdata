import 'dart:ui';

import 'package:flutter/material.dart';
import '../data/database_new.dart';

class ItemScreens extends StatelessWidget {
  ItemScreens({Key? key, required this.indexData}) : super(key: key);
  int indexData;
  SqlDb db = SqlDb();

  Future<List<Map>>? readData() async {
    List<Map> response = await db.readData("SELECT * FROM notes2");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HomeScreen',
          textAlign: TextAlign.center,
        ),
        // centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/images/17.jpg', fit: BoxFit.fill),
          ),
          Column(
            children: [
              const SizedBox(
                height: 7,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromARGB(118, 18, 93, 255),
                      ),
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.97,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromARGB(118, 255, 18, 109),
                        ),
                        height: MediaQuery.of(context).size.height * 0.47,
                        width: MediaQuery.of(context).size.width * 0.97,
                        child: FutureBuilder(
                            future: readData(),
                            builder: ((BuildContext context,
                                AsyncSnapshot<List<Map>> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                    '${snapshot.data![indexData]['nameprodect']}',
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600));
                              }
                              return const Center(
                                  child: CircularProgressIndicator());
                            }))
                        //  Text(
                        //                   '${snapshot.data![indexData]['nameprodect']}',
                        //                   style: const TextStyle(
                        //                       fontSize: 22,
                        //                       fontWeight: FontWeight.w600)),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
