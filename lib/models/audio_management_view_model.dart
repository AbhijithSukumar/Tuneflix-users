// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuneflix_user/models/audio_model.dart';
import 'package:tuneflix_user/ngrok.dart';

class AudioManagemenViewModel extends ChangeNotifier{
  List<AudioModel> _audios=[];

  List<AudioModel> get audios => _audios;

  void getVideos()async{
     dynamic response=await http.get(
      Uri.parse("${Ngrok.url}/api/audios")
     );

     print(jsonDecode(response.body));
     Map<String,dynamic> responseToMap=jsonDecode(response.body);
     List<dynamic> audioList=responseToMap["audios"];
     List<AudioModel> tempAudios=[];
     for (var data in audioList) {
      var audio=AudioModel.fromMap(data);
      print(audio.fileName);
      tempAudios.add(audio);
     }
     _audios=tempAudios;
     notifyListeners();
  }
}