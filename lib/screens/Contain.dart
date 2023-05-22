import 'package:flutter/material.dart';

import 'Scr1.dart';

class containn extends StatelessWidget {
Icon x;
Color y;
String str;
containn(this.x,this.y ,this.str);
  @override
  Widget build(BuildContext context) {
     return Expanded(
              child:(
                 Padding(
                  padding:EdgeInsets.only(top:20,left: 8,right: 8),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return myScr(str);
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration
                      (borderRadius:BorderRadius.circular(10),  color: y,),
                    
                      child:Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [x, Text(str,style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold ),)],
                              
                      ) ,
                      
                    ),
                  ),
                )
              ),
            );
  }
}