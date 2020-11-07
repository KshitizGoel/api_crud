import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Custom_Texts extends StatelessWidget{

  final String textFromActivities;
  final double fontSize;
  Custom_Texts(this.textFromActivities , this.fontSize);

  @override
  Widget build(BuildContext context) {
   return  Padding(

     padding: EdgeInsets.all(10.0),

       child: Text(
           textFromActivities,
           style: GoogleFonts.poppins(
               textStyle: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: fontSize,
                   color: Colors.black
               )
       )
      ),
     );

  }

}