import 'package:aps_party/layers/domain/entity/party_agenda.dart';
import 'package:aps_party/layers/domain/entity/video_model.dart';
import 'package:aps_party/layers/domain/services/home_services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class VideoController extends GetxController {
  final DataService _dataService = DataService();
  var myData = <PartyAgendaModel>[].obs;
  var videoList = <VideoMode>[].obs;


  void fetchData(String type) async 
  {
    try {
      
      videoList.value = await _dataService.fetchDataFromVideotype(type);
    } catch (e) {}
  }
}
