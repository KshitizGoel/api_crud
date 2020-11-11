import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFields extends StatelessWidget{
  
  //Controllers are to be added.
  
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  
  CustomTextFields(this.hintText , this.labelText, this.textInputType, this.controller) ;
  
  @override
  Widget build(BuildContext context) {
  
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
            )
          ),
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey
            )
        )
        ),
      ),
      
    );
  }
  
}