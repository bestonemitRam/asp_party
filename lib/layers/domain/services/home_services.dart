import 'dart:convert';

import 'package:aps_party/layers/domain/entity/morcha_model.dart';
import 'package:aps_party/layers/domain/entity/news.dart';
import 'package:aps_party/layers/domain/entity/party_agenda.dart';
import 'package:aps_party/layers/domain/entity/video_model.dart';
import 'package:aps_party/layers/presentation/view/home_widget/agenda.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  DocumentSnapshot? _lastDocument;
  List<PartyAgendaModel> data = [];
  List<VideoMode> video_data = [];

  Future<List<PartyAgendaModel>> fetchData() async {
    try {
      //  AppHelper.language = LanguageModel.languageList()[i].languageCode;

      CollectionReference myCollection =
          FirebaseFirestore.instance.collection('agenda');

      QuerySnapshot snapshot = await myCollection.get();

      if (snapshot.docs.isNotEmpty) {
        _lastDocument = snapshot.docs.last;

        data = snapshot.docs
            .map((doc) => PartyAgendaModel(
                  img: doc['img'],
                ))
            .toList();
      }

      print("kdfhgdgh ${data.length} ");
      return data;
    } catch (e) {
      throw e;
    }
  }

  // videos
  Future<List<VideoMode>> fetchDataFromVideo() async {
    try {
      CollectionReference myCollection =
          FirebaseFirestore.instance.collection('videos');
      QuerySnapshot snapshot = await myCollection.get();

      if (snapshot.docs.isNotEmpty) {
        _lastDocument = snapshot.docs.last;
        video_data = snapshot.docs
            .map((doc) => VideoMode(
                  title: doc['title'],
                  video_url: doc['video_url'],
                  description: doc['description'],
                ))
            .toList();
      }

      print("fdgdfdfggdfg ${video_data.length} ");
      return video_data;
    } catch (e) {
      throw e;
    }
  }

  Future<List<VideoMode>> fetchDataFromVideotype(String type) async {
    print("dkjhgkjdfgkfdhg");
    try {
      List<VideoMode> video_data = [];
      CollectionReference myCollection =
          FirebaseFirestore.instance.collection(type);
      QuerySnapshot snapshot = await myCollection.get();

      if (snapshot.docs.isNotEmpty) {
        _lastDocument = snapshot.docs.last;
        video_data = snapshot.docs
            .map((doc) => VideoMode(
                  title: doc['title'],
                  video_url: doc['video_url'],
                  description: doc['description'],
                ))
            .toList();
      }

      print("fdgdfdfggdfg ${video_data.length} ");
      return video_data;
    } catch (e) {
      throw e;
    }
  }

  Future<List<NewsModel>> fetchNews() async 
  {
    print("dkjhgkjdfgkfdhg");
    try {
      List<NewsModel> video_data = [];
      CollectionReference myCollection =
          FirebaseFirestore.instance.collection('aspnews');
      QuerySnapshot snapshot = await myCollection.get();

      if (snapshot.docs.isNotEmpty) {
        _lastDocument = snapshot.docs.last;
        video_data = snapshot.docs
            .map((doc) => NewsModel(
                  title: doc['title'],
                  img_url: doc['img_url'],
                  description: doc['description'],
                  date: doc['date']
                ))
            .toList();
      }

      print("fdgdfdfggdfg ${video_data.length} ");
      return video_data;
    } catch (e) {
      throw e;
    }
  }

   Future<List<MorchaModel>> fetchMorchaData() async 
  {

    try {
      List<MorchaModel> video_data = [];
      CollectionReference myCollection =
          FirebaseFirestore.instance.collection('morcha');
      QuerySnapshot snapshot = await myCollection.get();

      if (snapshot.docs.isNotEmpty) {
        _lastDocument = snapshot.docs.last;
        video_data = snapshot.docs
            .map((doc) => MorchaModel(
                  title: doc['title'],
                  img_url: doc['img_url'],
                  description: doc['description'],
                  date: doc['date'],
                    link_url: doc['link_url'],
                      name: doc['name'],
                        city: doc['city'],
                ))
            .toList();
      }

      print("fdgdfdfggdfg ${video_data.length} ");
      return video_data;
    } catch (e) {
      throw e;
    }
  }


  
}
