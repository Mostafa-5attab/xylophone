import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton ({
  required double width ,
  required Color background,
  required Function function,
  required String text,
  bool upperCase = true,

}) =>Container(
  width: width,
  height: 55,
  color: background,
  child: MaterialButton(
    onPressed: (){
      function();
    },

    child: Text( upperCase ? text.toUpperCase() : text.toLowerCase(),
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white
      ),
    ),
  ),
);







Widget defaultTextFormFiled({
  required TextEditingController controller ,
  required TextInputType type,
  required Function validate ,
  required String labelText,
  required IconData prefixIcon ,
}) =>TextFormField(
  controller: controller,
  keyboardType: type,
  validator: (s){
    validate(s);
  },
  // onFieldSubmitted: (String value){
  //   print(value);
  // },
  // onChanged: (String value){
  //   print(value);
  // },
  decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: labelText,
      prefixIcon: Icon(
        prefixIcon
      ),
  )
);
