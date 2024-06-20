



import 'package:aps_party/layers/domain/entity/news.dart';
import 'package:aps_party/layers/domain/entity/party_agenda.dart';
import 'package:aps_party/layers/domain/entity/video_model.dart';
import 'package:aps_party/layers/domain/services/home_services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class NewsController extends GetxController {
  final DataService _dataService = DataService();
  
  var newsList = <NewsModel>[].obs;


  void fetchData() async 
  {
    try {
      
      newsList.value = await _dataService.fetchNews();
    } catch (e) {}
  }




  
}
