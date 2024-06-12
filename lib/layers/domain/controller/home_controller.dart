import 'package:aps_party/layers/domain/entity/party_agenda.dart';
import 'package:aps_party/layers/domain/services/home_services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MyController extends GetxController {
   final DataService _dataService = DataService();
     var myData = <PartyAgendaModel>[].obs;
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async
   {
    try {
      myData.value = await _dataService.fetchData();
    } catch (e) {}
  }
}
