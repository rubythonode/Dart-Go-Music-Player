//import 'Song.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

class SongList {
//  final List<Song> songs = new List();
final List<String> songs = new List();

  static const String _serviceUrl = 'http://10.0.0.6:8000/api/filelist';

  static Future loadFromService() {
    List songs = new List();
    Completer completer = new Completer();
    get(_serviceUrl).then((Response response) {
      final String body = response.body;
    //  print("$body");
      final JsonDecoder _decoder = new JsonDecoder();
      final Map raw = _decoder.convert(body);
      for (String song in raw['songs']) {
     //   print("${map['title']}");
   //     Song song = new Song();
   //     song.fromMap(map);
      //  print("${song.songTitle}");
     //   songs.add(song);
        songs.add(song);
  //      print("$songs");
      }
      completer.complete(songs);
    });
    return completer.future;
  }


}