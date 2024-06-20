// ignore_for_file: prefer_const_constructors

import 'package:aps_party/layers/presentation/DefaultFirebaseOptions.dart';
import 'package:aps_party/layers/presentation/view/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message}   ${message.data}');
  print("dsfmlkdsfglk ${message.data}");
}

final FlutterTts flutterTts = FlutterTts();

void _initializeTts() {
  flutterTts.setLanguage("hi-IN");
  flutterTts.setPitch(1.0);
  flutterTts.setSpeechRate(0.5);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  _initializeTts();

  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    print("Error loading .env file: $e");
  }

  await Firebase.initializeApp(
    name: 'asp_party',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  allInitialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

Future<void> allInitialize() async {
  _firebaseMessaging.subscribeToTopic('shotnews');

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  var status = await Permission.ignoreBatteryOptimizations.status;
  if (!status.isGranted) {
    var status = await Permission.ignoreBatteryOptimizations.request();
    if (status.isGranted) {
      debugPrint("Good, all your permission are granted, do some stuff");
    } else {
      debugPrint("Do stuff according to this permission was rejected");
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram',
        // theme: ThemeData.dark(),
        home: HomePage(),
      );
    });
  }
}
