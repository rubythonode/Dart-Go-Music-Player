import 'package:flutter/material.dart';
//import 'Song.dart';
import 'SongList.dart';
//import 'package:http/http.dart';
import "package:flutter/services.dart" as services;

main() async {
//  List<Song> songs = await SongList.LoadFromService();
List<String> songs = await SongList.loadFromService();
  runApp(new MyApp(songs));
}

class MyApp extends StatelessWidget {
 // List<Song> songs;
  List<String> songs;
  MyApp(this.songs);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Simple Flutter"),
        backgroundColor: Colors.blue
      ),
      body: new ListView(
        children: getTiles()
      )
    );
  }

  List<ListTile> getTiles() {
    List<ListTile> list = new List();
 //   for (Song song in songs) {
    for (String song in songs) {
      ListTile tile = new ListTile(
        title: new Text(song),
  //      subtitle: new Text(song.fileName),
  //      leading: new CircleAvatar(child: new Text(song.songTitle[0])),
          leading: new CircleAvatar(child: new Text(song[0])),
        onTap: () => OnTap(song)

      );
      list.add(tile);
    }
    return list;
  }

//  static OnTap(Song song) {
  static OnTap(String song) {
//    get("http://10.0.0.6/dart_music/?song=${song.fileName}").then((_) {});
//    get("http://10.0.0.6:8080/radio2/?song=${song.fileName}").then((_) {});
  services.UrlLauncher.launch("http://10.0.0.6/dart_music/?song=$song");




  }
}
