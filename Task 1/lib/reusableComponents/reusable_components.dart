import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppStrings {
  static String appFont = 'candy';
}

class AppColor {
  static Color primaryColor = Colors.teal;
  static Color hintColor = Colors.grey;
}

Widget defaultTextFormFieldWidget({
  context,
  required TextEditingController controller,
  required TextInputType inputType,
  required String labelText,
  required String errorMessage,
  IconData? prefixIcon,
  Widget? prefixWidget,
  bool obscureText = false,
}) =>
    TextFormField(
      style: TextStyle(color: Colors.black),
      keyboardType: inputType,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: HexColor('##28383f')),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.indigo),
          borderRadius: BorderRadius.circular(15),
        ),
        label: Text(
          labelText,
          style: TextStyle(
            color: AppColor.hintColor,
          ),
        ),
        prefixIcon: Icon(prefixIcon, color: HexColor('#92e3a9')),
        prefix: prefixWidget,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return errorMessage;
        }
      },
    );

Widget defaultTextButton(
        {required VoidCallback function,
        required String text,
        Color color = Colors.black}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: color,
        ),
      ),
    );

Widget defaultButton({
  required VoidCallback function,
  required String text,
}) =>
    Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
          onTap: function,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: AppStrings.appFont),
            ),
          )),
    );
