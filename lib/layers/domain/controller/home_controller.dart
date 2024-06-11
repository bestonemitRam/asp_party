import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MyController extends GetxController {
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
  //    myData.value = await _dataService.fetchData();
    } catch (e) {}
  }
}
