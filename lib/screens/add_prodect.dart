import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/database_new.dart';
import 'home_screen.dart';

class AddProdect extends StatefulWidget {
  const AddProdect({Key? key}) : super(key: key);

  @override
  State<AddProdect> createState() => _AddProdectState();
}

class _AddProdectState extends State<AddProdect> {
  SqlDb addItems = SqlDb();

  String nameProdect = '';
  int salaryItem = 0;
  int conter = 0;
  int sumsalary = 0;
  bool checkProdect = false;
  int respnse = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 171, 187),
        appBar: AppBar(
            title: const Text('اضافة منتج',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 15, 189, 189)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 188, 241, 246)),
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Form(
                      child: Column(
                    children: [
                      const Text(
                        'اسم المنتج',
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: const TextStyle(fontSize: 25),
                        decoration: InputDecoration(
                          hintText: 'اسم المنتج',
                          hintStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          suffixIcon: const Icon(
                            Icons.shopping_cart_outlined,
                          ),
                        ),
                        textAlign: TextAlign.end,
                        onChanged: (value) {
                          setState(() {
                            nameProdect = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'سعر الكارتون',
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: const TextStyle(fontSize: 25),
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          setState(() {
                            salaryItem =
                                value.isNotEmpty ? int.parse(value) : 0;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'سعر الكارتون',
                          hintStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          suffixIcon: const Icon(
                            Icons.monetization_on,
                          ),
                        ),
                        textAlign: TextAlign.end,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'عدد الكراتين',
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            conter = value.isNotEmpty ? int.parse(value) : 0;
                          });
                        },
                        style: const TextStyle(fontSize: 25),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'عدد الكراتين',
                          hintStyle: const TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          suffixIcon: const Icon(
                            Icons.interests_outlined,
                          ),
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ))),
              CupertinoButton(
                  child: const Text(
                    'أضهر الناتج',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  onPressed: () {
                    setState(() {
                      checkProdect = true;
                      sumsalary = conter * salaryItem;
                    });
                  }),
              const Text(
                ':مجموع',
                style: TextStyle(fontSize: 30),
              ),
              Container(
                  height: 58,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 196, 197, 196),
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(14),
                  child: Text(
                    '$sumsalary ID',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                  )),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (checkProdect) {
                    respnse = await addItems.insertData('''
                          INSERT INTO notes2
                         (`nameprodect`,`salaryItem`,`conter`,`sumsalary`)
                          VALUES ("$nameProdect",$salaryItem,$conter,$sumsalary)
                          ''');
                    print('${respnse}');
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                        fullscreenDialog: true));
                  }
                },
                child: const Text('اضف الى المخزن',
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center),
                style: ElevatedButton.styleFrom(
                    elevation: 9,
                    primary: Color.fromARGB(255, 131, 128, 128),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.5, 60)),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }
}
