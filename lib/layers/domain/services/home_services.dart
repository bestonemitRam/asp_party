import 'dart:convert';

import 'package:aps_party/layers/domain/entity/party_agenda.dart';
import 'package:aps_party/layers/presentation/view/home_widget/agenda.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  DocumentSnapshot? _lastDocument;
  List<PartyAgendaModel> data = [];
  Future<List<PartyAgendaModel>> fetchData() async {
    try {
      print("lkdjfgjkfjh");
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
}
