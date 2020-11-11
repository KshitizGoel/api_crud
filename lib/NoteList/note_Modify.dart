import 'package:api_crud/CustomTextFields/TextFields.dart';
import 'package:api_crud/CustomTexts/Texts.dart';
import 'package:api_crud/Services/notes_services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:api_crud/model/note.dart';


class NoteModify extends StatefulWidget{
  final String noteID;
  NoteModify({this.noteID});

  @override
  State<StatefulWidget> createState() {
    return NoteModifyState();
  }
}

class NoteModifyState extends State<NoteModify>{

  bool get isEditing => widget.noteID != null;

  NoteService get notesService => GetIt.instance<NoteService>();

  String errorMessage;
  Note note;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  bool _isLoading = false;


  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });

    notesService.getNote(widget.noteID).then((response){

    setState(() {
      _isLoading = false;
    });

    if(response.error){
      errorMessage = response.errorMessage ?? "An error ocurred" ;
    }
    note = response.data;
    _titleController.text = note.noteTitle;
    _contentController.text = note.noteContent;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(100),
          ),
        ),
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
                TextInputType.text,
              _titleController // Will fetch the title from the API.
            ),
            CustomTextFields(
                "Notes 2 Label",
                "Notes 2 Hint",
                TextInputType.number,
              _contentController // Will fetch the content from the API.
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