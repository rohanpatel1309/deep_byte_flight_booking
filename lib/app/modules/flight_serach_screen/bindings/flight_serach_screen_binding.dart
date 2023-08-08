import 'package:get/get.dart';

import '../controllers/flight_serach_screen_controller.dart';

class FlightSerachScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlightSerachScreenController>(
      () => FlightSerachScreenController(),
    );
  }
}
