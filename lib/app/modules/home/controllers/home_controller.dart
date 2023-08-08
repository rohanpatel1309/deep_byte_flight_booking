import 'package:deep_byte_flight_booking/app/models/flight_search_model.dart';
import 'package:deep_byte_flight_booking/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  late List<FlightSearchModel> bookedFlight = [];

  /// Navigate to flight search screen
  void navigateToFlightSearchScreen(){
    Get.toNamed(Routes.FLIGHT_SERACH_SCREEN);
  }

  /// Navigate to booked flight screen
  void navigateToBookedFlightScreen(){
    Get.toNamed(Routes.BOOKED_FLIGHT_SCREEN);
  }


}
