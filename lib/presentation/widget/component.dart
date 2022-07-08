import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType inputType,
  required Function (String) validate,
  required String label,
  required bool isPass
})=>TextFormField(
  controller: controller,
  keyboardType: inputType,
  obscureText: isPass,
  validator: (s){
    return validate(s!);
  },
  decoration: InputDecoration(
      label: Text(label),

      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
      )
  ),
);

Widget defaultButton({required Function function,required text})=>MaterialButton(onPressed: (){
  function();
},color: Colors.blue,
  height: 61,
  minWidth: 152,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  child: Text(text),);


