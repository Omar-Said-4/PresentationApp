import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget TextForm({
  required TextEditingController controller,
  required TextInputType type,
  String? error,
  bool ispassword = false,
  required String label,
  required IconData prefix,
  Function(String)? onSubmit,
  Function(String)? onchange,
  IconData? suffix,
  Function? suffixPressed, required Null Function(dynamic s) onChange,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: TextFormField(
            onChanged: onchange,
            onFieldSubmitted: onSubmit,
            controller: controller,
            keyboardType: type,
            obscureText: ispassword,
            // validator: validate(){},
            decoration: InputDecoration(
              errorText: error,
              border: InputBorder.none,
              hintText: label,
              prefixIcon: Icon(prefix),
              suffixIcon: suffix != null
                  ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
                  : null,
            ),
          ),
        ),
      ),
    );
