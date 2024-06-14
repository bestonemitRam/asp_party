import 'package:aps_party/layers/domain/entity/banner_member.dart';
import 'package:aps_party/layers/domain/entity/party_agenda.dart';
import 'package:aps_party/layers/domain/entity/profiledata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PartyAgenda extends StatelessWidget {
  final PartyAgendaModel myData;

  const PartyAgenda({super.key, required this.myData});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
  
        Container(
          height: 18.h,
          width: MediaQuery.of(context).size.width / 1.5,
          margin: EdgeInsets.only(left: 10.0, right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
      
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: myData.img.toString(),
              // height: 200,
              width: double.infinity,
              placeholder: (context, url) =>
                  Center(child: const CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
         ],
    );
  }
}
