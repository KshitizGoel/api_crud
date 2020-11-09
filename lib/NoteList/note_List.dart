import 'package:api_crud/CustomTexts/Texts.dart';
import 'package:api_crud/NoteList/note_Modify.dart';
import 'package:api_crud/Services/notes_services.dart';
import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'note_Delete.dart';
import 'package:api_crud/model/NoteForListing.dart';


class NoteList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }

}
class NoteListState extends State<NoteList>{

  NoteService get service => GetIt.instance<NoteService>();

  List <NoteForListing> notes= [];

  void initState(){
    notes = service.getNoteList();
    super.initState();
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
      title: Custom_Texts("Notes List" , 24.0),
    ),

    floatingActionButton: FloatingActionButton(

      onPressed: (){ },
      child: Icon(Icons.add),
    ),

    body: ListView.separated(


      separatorBuilder: (_,context) => Divider(
        height: 1,
        color: Colors.green,
    ),

      itemCount: notes.length,


      itemBuilder: (_,index){
        return Dismissible(
          key: ValueKey(notes[index].noteID),

          // Exception: A dismissed Dismissible widget... will be occurring as the onDismissed() is yet to be completed...
          direction: DismissDirection.startToEnd,
          onDismissed: (direction){

        },

        confirmDismiss: (direction) async{
            final result = await showDialog(context: context ,
        builder: (_) => NoteDelete());
            return result;
        },

        background: Container(
            color: Colors.red,
            padding: EdgeInsets.all(10),
            child: Align(child: Icon(Icons.delete_sweep),),
            ),
        child: ListTile(
              title: Text(
              notes[index].noteTitle,
              style: GoogleFonts.poppins(
              textStyle: TextStyle(

                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24.0

                    )
                  ),

                 ),

              subtitle: Custom_Texts("Last edited on ${notes[index].latestDateTime}" , 18.0),

              onTap: (){
                Navigator.of(context).push(
                MaterialPageRoute(
              builder: (_) => NotesModify(noteID : notes[index].noteID)
              )
                );
              },
          ),
        );
      },

    ),

  );
  }

}