import 'package:aps_party/layers/domain/entity/morcha_model.dart';
import 'package:aps_party/layers/domain/entity/party_agenda.dart';
import 'package:aps_party/layers/domain/entity/video_model.dart';
import 'package:aps_party/layers/domain/services/home_services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MorchaContoller extends GetxController {
  final DataService _dataService = DataService();

  var videoList = <MorchaModel>[].obs;

  void fetchData() async {
    try {
      videoList.value = await _dataService.fetchMorchaData();
    } catch (e) {}
  }
}
