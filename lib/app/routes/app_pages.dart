import 'package:get/get.dart';

import '../modules/booked_flight_screen/bindings/booked_flight_screen_binding.dart';
import '../modules/booked_flight_screen/views/booked_flight_screen_view.dart';
import '../modules/flight_serach_screen/bindings/flight_serach_screen_binding.dart';
import '../modules/flight_serach_screen/views/flight_serach_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FLIGHT_SERACH_SCREEN,
      page: () => const FlightSerachScreenView(),
      binding: FlightSerachScreenBinding(),
    ),
    GetPage(
      name: _Paths.BOOKED_FLIGHT_SCREEN,
      page: () => const BookedFlightScreenView(),
      binding: BookedFlightScreenBinding(),
    ),
  ];
}
