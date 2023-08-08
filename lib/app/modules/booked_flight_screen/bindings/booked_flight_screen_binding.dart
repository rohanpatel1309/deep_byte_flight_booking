import 'package:get/get.dart';

import '../controllers/booked_flight_screen_controller.dart';

class BookedFlightScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookedFlightScreenController>(
      () => BookedFlightScreenController(),
    );
  }
}
