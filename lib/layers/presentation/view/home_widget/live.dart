import 'package:aps_party/layers/presentation/view/sidemenu/party_Organizations.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/party_agenda_screen.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/party_description.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/party_foundations.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/party_history.dart';
import 'package:aps_party/layers/presentation/view/sidemenu/party_president.dart';
import 'package:flutter/material.dart';

class LiveVideo extends StatefulWidget {
  @override
  _LiveVideoState createState() => _LiveVideoState();
}
    //AddPage(),

class _LiveVideoState extends State<LiveVideo> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ASP Party ",
          style: TextStyle(
              fontFamily: 'Fontspring-DEMO-blue_vinyl_regular_ps_ot',
              fontSize: 30),
        ),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: [
            Tab(text: 'About Party'),
            Tab(text: 'Party President'),
            Tab(text: 'Party History'),
            Tab(text: 'Party Agenda'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PartyDescription(),
          PartyPresident(),
          PartyHistory(),
          PartyAgendaHistroy(),
        ],
      ),
    );
  }
}
