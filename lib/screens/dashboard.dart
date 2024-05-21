import 'package:flutter/material.dart';
import 'package:tuneflix_user/routes.dart';

class OTTDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('OTT Dashboard',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Video Card
            InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.videoList);
                    },
                    child: VideoCard()),
            SizedBox(height: 16.0), // Add spacing between cards

            // Music Card
            InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.audioList);
                    },
                    child: MusicCard()),
          ],
        ),
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with code to fetch actual video data (e.g., from API)
    final videoCount = 1000; // Placeholder value

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.video_library_outlined, size: 40.0),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Videos',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'All category Videos coming soon',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MusicCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with code to fetch actual music data (e.g., from API)
    //final musicCount = 5000; // Placeholder value

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.music_note, size: 40.0),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Music',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Listen and enjoy',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
