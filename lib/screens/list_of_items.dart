import 'package:flutter/material.dart';
import 'item_details.dart';
class LIST_OF_ITEMS extends StatelessWidget {
  List datalist;
  int start,end;

  LIST_OF_ITEMS(List li,int s,int e) {
    this.datalist = li;
    this.start=s;
    this.end=e;
  }
void  gotodetail(BuildContext context,Map data){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext ctx) => ITEM_DETAIL(data)));
}
  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        child:
        Column(
          children: [
            for(int i=start;i<end;i++)
              InkWell(
                onTap: () => gotodetail(context,datalist[i]),
                child: Card(
                  margin: EdgeInsets.all(10),
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: Image.network(
                                datalist[i]['image'],
                                fit: BoxFit.cover,
                              )),
                          Positioned(
                            bottom: 30,
                            right: 10,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              width: 250,
                              child: Text(datalist[i]['type'],
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 0.8),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 20, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("price :  ${datalist[i]['price']}"),
                            SizedBox(width: 10,),
                            Icon(Icons.attach_money,color:Colors.black ,size: 30,),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      );
  }
}
