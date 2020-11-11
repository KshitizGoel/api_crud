import 'dart:convert';

import 'package:api_crud/model/NoteForListing.dart';
import 'package:api_crud/model/api_response.dart';
import 'package:http/http.dart' as http;
import 'package:api_crud/model/note.dart';

class NoteService {
  static const API = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app';
  static const headers = {'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471'};

  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
              notes.add(NoteForListing.fromJson(item));
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }

      return APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occurred 29');

    })
        .catchError((_) => APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occurred 33 '));
  }

  Future <APIResponse<Note>> getNote (String noteID){
    return http.get(API + "/notes" + noteID, headers : headers ).then((data) {

      if(data.statusCode == 200){
        final jsonData = json.decode(data.body);
        return APIResponse<Note> (data: Note.fromJson(jsonData));
      }

      return APIResponse<Note>(
        error: true,
        errorMessage: "There is an error in line 39"
      );
    })
        .catchError((_) => APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occurred 42 '));
  }

}