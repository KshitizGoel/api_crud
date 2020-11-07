import 'package:api_crud/CustomTexts/Texts.dart';
import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Custom_Texts("Warning!" , 20.0),

      content: Custom_Texts("Are you sure you want to delete?" , 15),

      actions: <Widget>[
        FlatButton(
          child: Custom_Texts("Yes" , 10),
          onPressed: (){
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: Custom_Texts("No" , 10),
          onPressed: (){
            Navigator.of(context).pop(false);
          },
        )
      ],

    ) ;
  }
}