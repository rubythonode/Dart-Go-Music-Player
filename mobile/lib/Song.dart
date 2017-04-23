class Song {
  String fileName;
  String songTitle;

  Song({this.fileName, this.songTitle});
  fromMap(Map map) {
    this.songTitle = map['title'];
    this.fileName = map['file'];
  }
}