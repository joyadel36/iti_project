import 'package:flutter/material.dart';

import 'screens/Contain.dart';

class welpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: const Text(
          "Welcome ",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: SafeArea(
        child: Container(
          // height: double.infinity,
          decoration: BoxDecoration(
              image:  DecorationImage(
                  image: NetworkImage('https://d2pas86kykpvmq.cloudfront.net/images/humans-3.0/pose_26.png'),
                  fit:BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.white.withOpacity(.9),BlendMode.modulate)
              )

          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: MediaQuery.of(context).size.height/3,),
              Expanded(
                child: Row(

                  children: [
                    containn(const Icon(Icons.male,size: 80,color:Colors.white,),Colors.amber.withOpacity(.5),"Men"),
                    containn(const Icon(Icons.female,color: Colors.white,size: 80,),Colors.white.withOpacity(.5),"Women"),
                  ],
                ),
              ),
              Expanded(
                child: Row(

                  children: [
                    containn(const Icon(Icons.boy,color: Colors.white,size: 80,),Colors.white.withOpacity(.5),"Boy"),
                    containn(const Icon(Icons.girl,color: Colors.white,size: 80,),Colors.amber.withOpacity(.5),"Girl"),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
