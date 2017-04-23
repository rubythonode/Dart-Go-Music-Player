// Copyright (c) 2017, child. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:web_audio';

AudioContext audioContext = new AudioContext();

void main() {
  // querySelector('#output').text = 'Your Dart app is running.';
  String songName = Uri.base.queryParameters['song'];

  String songPath = "songs/$songName";
  HttpRequest.request(songPath, responseType: "arraybuffer").then((HttpRequest request) {
    audioContext.decodeAudioData(request.response).then((AudioBuffer buffer) {
      AudioBufferSourceNode sourceNode = audioContext.createBufferSource();
      sourceNode.buffer = buffer;
      sourceNode.connectNode(audioContext.destination);
      sourceNode.start(0);
    });
  });
  querySelector('#output').text = "$songName is playing";
}
