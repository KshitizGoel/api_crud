import 'package:flutter/material.dart';

class NoteForListing {
  String noteID, noteTitle;
  DateTime createDateTime , latestDateTime;

  NoteForListing({this.noteID , this.noteTitle , this.createDateTime , this.latestDateTime});

  factory NoteForListing.fromJson(Map<String,dynamic> item){
    return NoteForListing(
      noteID: item['noteID'],
      noteTitle: item['noteTitle'],
      createDateTime: DateTime.parse(item['createDateTime']),
      latestDateTime: item['latestEditDateTime'] != null
          ? DateTime.parse(item['latestEditDateTime'])
          : null,
    );
  }

}