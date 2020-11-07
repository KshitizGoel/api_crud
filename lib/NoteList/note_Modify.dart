import 'package:api_crud/CustomTextFields/TextFields.dart';
import 'package:api_crud/CustomTexts/Texts.dart';
import 'package:flutter/material.dart';

class NotesModify extends StatelessWidget{

  final String noteID;
  bool get isEditing => noteID != null;

  NotesModify({this.noteID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:
          isEditing? Custom_Texts("Edit Notes" , 18.0) : Custom_Texts("Create Notes" , 18.0),
      ),

      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            CustomTextFields(
             "Notes 1 Label",
              "Notes 1 Hint",
              TextInputType.text
            ),
            CustomTextFields(
                "Notes 2 Label",
                "Notes 2 Hint",
                TextInputType.number
            ),

            Container(height:16),
            SizedBox(
              width: double.infinity,
              height: 30,
              child: RaisedButton(
                elevation: 20,
                onPressed:(){
                  Navigator.of(context).pop();
                }
              ),
            )
          ],
        ),
      ),

    );
  }

}