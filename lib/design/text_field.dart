import 'package:flutter/material.dart';

Widget TEXTFIELD(
  TextEditingController varname,
  var kbt,
  String label,
  String hint,
  Icon icon,
  bool ot,
) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: TextFormField(
      obscureText: ot,
      controller: varname,
      decoration: InputDecoration(
        hoverColor:Colors.amber,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        labelStyle: TextStyle(color:Colors.amber ),
        labelText: label,
        hintText: hint,
        hintStyle:TextStyle(color:Colors.amber ),
        suffixIcon: icon,
      ),
      keyboardType: kbt,
    ),
  );
}
