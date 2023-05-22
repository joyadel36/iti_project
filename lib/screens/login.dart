
import 'package:flutter/material.dart';
import 'package:iti_final_project/screens/scr2.dart';
import 'package:iti_final_project/screens/signup.dart';

import '../data_base/database.dart';
import '../design/text_field.dart';

class LOGIN extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LOGIN_STATE();
  }
}

class _LOGIN_STATE extends State<LOGIN> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  DatabaseApp s = DatabaseApp();
  List li;
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://d2pas86kykpvmq.cloudfront.net/images/humans-3.0/pose_40.png'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(.8), BlendMode.modulate))),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TEXTFIELD(
                      email,
                      TextInputType.emailAddress,
                      'Email',
                      'Enter email',
                      Icon(
                        Icons.email,
                        color: Colors.amber,
                      ),
                      false,
                    ),
                    TEXTFIELD(
                      password,
                      TextInputType.visiblePassword,
                      'Password',
                      'Enter passwoed',
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
                          Text("login"),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.login,
                            size: 40,
                          ),
                        ],
                      ),
                      color: Colors.amber,
                        onPressed: () async {
                          li = await s.getData(s.db);
                          print(li);
                          for (int i = 0; i < li.length; i++) {
                            if (li[i]['name'] == email.text &&
                                li[i]['password'] == password.text) {
                              flag = true;
                            }
                            else
                            {
                              flag = false;
                            }

                          }
                          if (flag) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext ctx) => TABS_SCREEN()));
                          } else {
                            print('No');
                            showDialog(context: context, builder: (context) {
                              return  AlertDialog(
                                  title: Row(
                                    children: const[
                                      Icon(Icons.warning,color: Colors.red,),
                                      Text("Wrong password",style: TextStyle(color: Colors.red,fontSize: 23),),
                                    ],
                                  ),
                                  actions: [MaterialButton(onPressed: (){Navigator.of(context).pop();},child: Text("Close",style: TextStyle(fontSize: 18),),)],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))
                              );

                            });

                          }
                        },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextButton(
                        onPressed: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext ctx) => SIGNUP()));
                        },
                        child: Text("Create a new account"))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
