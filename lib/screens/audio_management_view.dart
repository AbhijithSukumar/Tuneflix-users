// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuneflix_user/models/audio_management_view_model.dart';
import 'package:tuneflix_user/ngrok.dart';
import 'package:tuneflix_user/routes.dart';

class AudioManagementView extends StatefulWidget {
  const AudioManagementView({super.key});

  @override
  State<AudioManagementView> createState() => _AudioManagementViewState();
}

class _AudioManagementViewState extends State<AudioManagementView> {
  @override
  Widget build(BuildContext context) {
    
  var videoProvider=Provider.of<AudioManagemenViewModel>(context,listen: false);

  videoProvider.getVideos();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Tuneflix",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        //leading: const SizedBox(),
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Log out'),
                    content: const Text('Are you sure to logout'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, Routes.login),
                        child: const Text('ok'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(Icons.logout,color: Colors.redAccent,),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<AudioManagemenViewModel>(
          builder: (context,data,_) {
            return GridView.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.9,
              crossAxisCount: 2,
              children: 
                data.audios.isNotEmpty?
                List.generate(data.audios.length, (index){
                  return InkWell(
                    onTap: ()async{
                      final prefs=await SharedPreferences.getInstance();
                      await prefs.setString("filepath", data.audios[index].fileName);
                      Navigator.pushNamed(context, Routes.audioPlayer);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              "${Ngrok.url}${data.audios[index].thumbnail}",
                              fit: BoxFit.fill,
                              width: 200,
                              height: 100,
                              ),
                          ),
                          Text(data.audios[index].title,style: const TextStyle(color: Colors.green),),
                          Text(data.audios[index].releaseYear.toString(),style: const TextStyle(color: Colors.green),),
                          Text(data.audios[index].genre,style: const TextStyle(color: Colors.green),),
                        ],
                      ),
                    ),
                  );
                }):[const Text("No audios")]
            );
          }
        ),
      ),
    );
  }
}