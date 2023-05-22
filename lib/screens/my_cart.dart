import 'package:flutter/material.dart';

import '../data_base/Database2.dart';

class MY_CART extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MY_CART_STATE();
  }
}

class MY_CART_STATE extends State<MY_CART> {
  DatabaseApp2 items = DatabaseApp2();

  Future<List<Map>> getdata() async {
    List<Map> mydata = await items.readData('SELECT * FROM item');
    return mydata;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          FutureBuilder(
              future: getdata(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: Card(
                                margin: EdgeInsets.all(10),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("item $i "),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text("Type : " +
                                                snapshot.data[i]['type']),
                                            Text(
                                                "Color :  ${snapshot.data[i]['color']}"),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text("Size :  ${snapshot.data[i]['size']}"),
                                            Text("number of items :  ${snapshot.data[i]['num']}"),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [Text(
                                              "Price of one item :  ${snapshot.data[i]['price']}"),],
                                        ),


                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Container(child: CircularProgressIndicator());
                }
              })
        ],
      ),
    );
  }
}
