// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';


// class DataService {
//   DocumentSnapshot? _lastDocument;
//   List<DashBoardModel> data = [];
//   Future<List<DashBoardModel>> fetchData() async {
//     try {
//       //  AppHelper.language = LanguageModel.languageList()[i].languageCode;

//       CollectionReference myCollection =
//           FirebaseFirestore.instance.collection('shortnews');

//       QuerySnapshot snapshot = await myCollection
         
       
//           .get();

//       if (AppHelper.checkPush == '') 
//       {
//         if (snapshot.docs.isNotEmpty) {
//           _lastDocument = snapshot.docs.last;

//           data = snapshot.docs
//               .map((doc) => DashBoardModel(
//                     id: doc.id,
//                     description: doc['description'],
//                     img: doc['img'],
//                     news_id: doc['news_id'],
//                     news_link: doc['news_link'],
//                     title: doc['title'],
//                     video: doc['video'],
//                     from: doc['from'],
//                     takenby: doc['takenby'],
//                   ))
//               .toList();
//         }
//       } else {
//         QuerySnapshot snapshot = await myCollection
//             .limit(2)
//             .where("doc_id", isEqualTo: AppHelper.checkPush)
//             .get();

//         if (snapshot.docs.isNotEmpty) {
//           _lastDocument = snapshot.docs.last;

//           data = snapshot.docs
//               .map((doc) => DashBoardModel(
//                     id: doc.id,
//                     description: doc['description'],
//                     img: doc['img'],
//                     news_id: doc['news_id'],
//                     news_link: doc['news_link'],
//                     title: doc['title'],
//                     video: doc['video'],
//                     from: doc['from'],
//                     takenby: doc['takenby'],
//                   ))
//               .toList();
//         }
//       }

//       final jsonString =
//           jsonEncode(data.map((model) => model.toJson()).toList());
//       await sharedPref.setString('dashboardModels', jsonString);

//       return data;
//     } catch (e) {
//       throw e;
//     }
//   }

// }
