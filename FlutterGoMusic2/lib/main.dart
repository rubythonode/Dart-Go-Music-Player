import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

List<String> songList = new List();

main() async {
  songList = await SongList.loadFromService();
  
  runApp(new MaterialApp(
      title: "Music Player",
      home: new Scaffold(
          appBar: new AppBar(
              title: new Text("Music Player"),
              backgroundColor: Colors.blue
          ),
          body: new MusicPlayer())
  ));
}

class MusicPlayer extends StatefulWidget {
  MusicPlayer({Key key}) : super(key: key);

  MusicPlayerState createState() => new MusicPlayerState();
}

class MusicPlayerState extends State<MusicPlayer> {
  List<ListTile> tileList = new List();

 @override
 void initState() {
   super.initState();
   for (String song in songList) {
     ListTile tile = new ListTile(
         leading: new CircleAvatar(child: new Text(song[0])),
         title: new Text(song),
         onTap: () => UrlLauncher.launch("http://10.0.0.6/dart_music/?song=$song")
     );
     tileList.add(tile);
   }
 }

  @override
  Widget build(BuildContext context) {
    return new ListView(children: tileList);
  }


}

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

