# Dart-Go-Music-Player
This is a retooled version of DartMusicPlayer, using Go to remove need for 2 music directories. You will need Go (golang.org, the Dart SDK (dartlang.org) and Flutter (github.com/flutter/flutter).

# Compiling
The first step is compiling the Go, using

<code>% go build </code>

Next, replace the files in <em>DartWebAudio/web/songs</em> with a few MP3 files. Compile the music playback Dart by

<code>% cd DartWebAudio </code>

<code>% pub get </code>

<code>% pub build </code>

Copy the Go executable to <em>DartWebAudio/build/web</em>, create a directory named "dart_music" in your web server, then copy the contents of the former directory into the new one. 

# Running the package
Before running the mobile app, start running the Go executable. The first time you want to run the app, 

<code>% cd ../mobile </code>

Connect your cellphone to your computer. Using the "flutter" command in the "bin" directory of your Flutter repo, 

<code>%flutter run </code>

If this command finishes successfully, the app should be installed as "Flutter3Simple". Wait for the song titles to load, then tap on a filename. Your cell browser should appear with a message, and your song should play shortly.
