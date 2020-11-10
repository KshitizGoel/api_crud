import 'dart:convert';

import 'package:api_crud/model/NoteForListing.dart';
import 'package:api_crud/model/api_response.dart';
import 'package:http/http.dart' as http;

class NoteService {
  static const API = 'http://api.notes.programmingaddict.com/swagger';
  static const headers = {'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471'};

  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          final note = NoteForListing(
            noteID: item['noteID'],
            noteTitle: item['noteTitle'],
            createDateTime: DateTime.parse(item['createDateTime']),
            latestDateTime: item['latestEditDateTime'] != null
                ? DateTime.parse(item['latestEditDateTime'])
                : null,
          );
          notes.add(note);
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured');
    })
        .catchError((_) => APIResponse<List<NoteForListing>>(error: true, errorMessage: 'An error occured'));
  }
}