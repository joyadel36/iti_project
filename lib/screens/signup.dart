// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:iti_final_project/screens/login.dart';

import '../data_base/database.dart';
import '../design/text_field.dart';

class SIGNUP extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIGNUP_STATE();
  }
}

class _SIGNUP_STATE extends State<SIGNUP> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Emil = TextEditingController();
  TextEditingController mobile = TextEditingController();
  DatabaseApp s=DatabaseApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TEXTFIELD(
              fname,
              TextInputType.name,
              'First name',
              'Enter first name',
               Icon(Icons.people,
                 color: Colors.amber,),
              false,
            ),
            TEXTFIELD(
              lname,
              TextInputType.name,
              'Last name',
              'Enter last name',
             Icon(Icons.people,
               color: Colors.amber,),
              false,
            ),
            TEXTFIELD(
              gender,
              TextInputType.name,
              'Gender',
              'Enter yor gender',
              Icon(Icons.people,
                color: Colors.amber,),
              false,
            ),
        
            TEXTFIELD(
              mobile,
              TextInputType.number,
              'Mobile',
              'Enter yor mobile number',
               Icon(Icons.phone,
                 color: Colors.amber,),
              false,
            ),
            TEXTFIELD(
              Emil,
              TextInputType.name,
              'Emil',
              'Enter yor Emil',
              Icon(Icons.email,
                color: Colors.amber,),
              false,
            ),
            TEXTFIELD(
              password,
              TextInputType.visiblePassword,
              'Password',
              'Enter Password',
              Icon(Icons.visibility,
                color: Colors.amber,),
              true,
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sign up"),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.login),
                  ],
                ),
                color:Colors.amber,
                onPressed: () async{
                  int r= await s.insertData('${Emil.text}','${password.text}',);
                  print(r);
                  print("${Emil.text}");
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext ctx) => LOGIN()));

                }),
            SizedBox(height: 30,),
        
          ],
        ),
      ),
    );
  }
}