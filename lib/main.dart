// ignore_for_file: prefer_const_constructors

import 'package:aps_party/layers/presentation/DefaultFirebaseOptions.dart';
import 'package:aps_party/layers/presentation/view/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message}   ${message.data}');
  print("dsfmlkdsfglk ${message.data}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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

  runApp(const MyApp());
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





// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Draggable Widget Example')),
//         body: DraggableWidget(),
//       ),
//     );
//   }
// }

// class DraggableWidget extends StatefulWidget {
//   @override
//   _DraggableWidgetState createState() => _DraggableWidgetState();
// }

// class _DraggableWidgetState extends State<DraggableWidget> {
//   double xPosition = 100;
//   double yPosition = 100;

//   @override
//   Widget build(BuildContext context) {
//     return
//      Scaffold(
//       body: SingleChildScrollView(
//         child: SizedBox(
//           height: 2000,
//           child: Stack(
//             children: [
//               Positioned(
//                 left: xPosition,
//                 top: yPosition,
//                 child: GestureDetector(
//                   onPanUpdate: (details) {
//                     setState(() {
//                       xPosition += details.delta.dx;
//                       yPosition += details.delta.dy;
//                     });
//                   },
//                   child: Container(
//                     width: 330,
//                     height: 100,
//                     color: Colors.blue,
//                     child: Center(child: Text('Drag me')),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
 
//   }
// }


