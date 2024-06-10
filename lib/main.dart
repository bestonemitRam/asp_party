// ignore_for_file: prefer_const_constructors

import 'package:aps_party/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram',
        theme: ThemeData.dark(),
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


