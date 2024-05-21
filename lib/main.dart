
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuneflix_user/models/audio_management_view_model.dart';
import 'package:tuneflix_user/models/video_management_view_model.dart';
import 'package:tuneflix_user/routes.dart';
import 'package:tuneflix_user/screens/audio_management_view.dart';
import 'package:tuneflix_user/screens/audio_player_view.dart';
import 'package:tuneflix_user/screens/dashboard.dart';
import 'package:tuneflix_user/screens/login.dart';
import 'package:tuneflix_user/screens/payment.dart';
import 'package:tuneflix_user/screens/premium.dart';
import 'package:tuneflix_user/screens/signup.dart';
import 'package:tuneflix_user/screens/splash.dart';
import 'package:tuneflix_user/screens/video_magement_view.dart';
import 'package:tuneflix_user/screens/video_player_view.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create:(context) => VideoManagemenViewModel(),),
      ChangeNotifierProvider(create:(context) => AudioManagemenViewModel(),)
    ],
    child: const Root()));
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      routes: {
        Routes.splash:(context) => const Splash(),
        Routes.login:(context) => const Login(),
        Routes.signup:(context) => const Signup(),
        Routes.premium:(context) => const ChoosePlanScreen(),
        Routes.payment:(context) =>  PaymentScreen(),
         Routes.videoList:(context) => const VideoManagementView(),
        Routes.videoPlayer:(context) => const VideoPlayerView(),
        Routes.audioList:(context) => const AudioManagementView(),
        Routes.audioPlayer:(context) => const AudioPlayerView(),
        Routes.dashboard:(context) =>  OTTDashboard()
         },
    );
  }
}