import 'package:api_crud/model/NoteForListing.dart';

class NoteService {


  List <NoteForListing> getNoteList(){
    return [

    NoteForListing(
        noteID : "1",
        createDateTime: DateTime.now(),
        latestDateTime: DateTime.now(),
        noteTitle: "Note1"
    ),
    NoteForListing(
        noteID : "2",
        createDateTime: DateTime.now(),
        latestDateTime: DateTime.now(),
        noteTitle: "Note2"
    ),
    NoteForListing(
        noteID : "3",
        createDateTime: DateTime.now(),
        latestDateTime: DateTime.now(),
        noteTitle: "Note3"
    ),
    NoteForListing(
        noteID : "4",
        createDateTime: DateTime.now(),
        latestDateTime: DateTime.now(),
        noteTitle: "Note4"
    ),
    NoteForListing(
        noteID : "5",
        createDateTime: DateTime.now(),
        latestDateTime: DateTime.now(),
        noteTitle: "Note5"
    ),
    NoteForListing(
        noteID : "6",
        createDateTime: DateTime.now(),
        latestDateTime: DateTime.now(),
        noteTitle: "Note6"
    )
    ];


  }



}