import 'package:aps_party/layers/domain/entity/banner_member.dart';
import 'package:aps_party/layers/domain/entity/party_agenda.dart';
import 'package:aps_party/layers/domain/entity/profiledata.dart';
import 'package:flutter/material.dart';

class PartyAgenda extends StatelessWidget {
  final PartyAgendaModel myData;

  const PartyAgenda({super.key, required this.myData});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 02, vertical: 10),
          child: CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(myData.img),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 04, vertical: 10),
        //   child: Text(
        //     userStory.name,
        //     style: TextStyle(fontSize: 16),
        //   ),
        // )
      ],
    );
  }
}
