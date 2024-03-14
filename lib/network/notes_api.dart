import 'dart:convert';

import 'package:getx_app/models/note_model.dart';
import 'package:getx_app/network/api_constants.dart';
import 'package:http/http.dart' as http;

class NotesServices{

  Future<List<Note>> fetchNotes() async {
    final response = await http.get(Uri.parse(ApiConstants.baseUrl + ApiConstants.notesEndpoint));
    if (response.statusCode == 200){
      final parsed = jsonDecode(utf8.decode(response.bodyBytes)).cast<Map<String,dynamic>>();
      return parsed.map<Note>((json) => Note.fromJson(json)).toList();
    }else{
      print(response.statusCode);
      print("error to fetch Product Api");
      throw Exception("Failed to load Notes data");
    }
  }
}