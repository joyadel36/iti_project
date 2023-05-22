import 'package:flutter/material.dart';
import '../data/app_data.dart';
import 'list_of_items.dart';
class myScr extends StatelessWidget {
  String gen;
  List li;
  myScr(String g)
  {
    this.gen=g;
    if (gen=="Girl")
    {
      li=GIRL_DATA;
    }
    else if(gen=="Boy")
    {
      li=Boy_DATA;
    }
    else if(gen=="Women")
    {
      li=Women_DATAList;
    }
    else if(gen=="Men")
    {
      li=Men_DATAList;
    }
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(size: 30,color: Colors.black),
            centerTitle: true,
            title: const Text("Fashion",style: TextStyle(fontSize: 30),),
            bottom:  const TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs:[
                Tab(child:  Text('T-Shirt/Shirt',style: TextStyle(fontSize: 18),),),
                Tab(child:  Text('Trousers',style: TextStyle(fontSize: 18),),),
                Tab(child:  Text('Shoes',style: TextStyle(fontSize: 18),),),

              ],
            ),
          ),
          body:TabBarView(
            children: [
              LIST_OF_ITEMS(li,0,3),
              LIST_OF_ITEMS(li,3,6),
              LIST_OF_ITEMS(li,6,9),


            ],

          )),

    );

  }
}
