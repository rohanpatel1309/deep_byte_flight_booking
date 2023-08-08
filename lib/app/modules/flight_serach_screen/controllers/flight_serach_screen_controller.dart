import 'package:deep_byte_flight_booking/app/models/flight_search_model.dart';
import 'package:deep_byte_flight_booking/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class FlightSerachScreenController extends GetxController {
  // Text editing controller
  TextEditingController originSearchController = TextEditingController();
  TextEditingController destinationSearchController = TextEditingController();
  TextEditingController dateSearchController = TextEditingController();

  RxString searchedOrigin = "".obs;
  RxString searchedDestination = "".obs;
  RxString searchedDate = "".obs;
  RxString searchText = "Search Flight".obs;



  late List<FlightSearchModel> flightSearchModelList =
      <FlightSearchModel>[].obs;
  late List<FlightSearchModel> searchedFlightModelList =
      <FlightSearchModel>[].obs;

  @override
  void onInit() {
    // Load data
    loadData();

    debounce(
      searchedOrigin,
      (value) => setResult(),
      time: const Duration(seconds: 1),
    );

    debounce(
      searchedDestination,
      (value) => setResult(),
      time: const Duration(seconds: 1),
    );

    debounce(
      searchedDate,
      (value) => setResult(),
      time: const Duration(seconds: 1),
    );

    super.onInit();
  }

  /// Load data
  void loadData() async {
    final String data = await rootBundle.loadString('assets/flight_data.json');

    flightSearchModelList = flightSearchModelFromJson(data);
  }

  /// Set Result
  void setResult() {
    searchedFlightModelList.clear();

    for (var element in flightSearchModelList) {

      // Single search
      if (originSearchController.text.trim().toLowerCase() ==
              element.origin.toLowerCase() &&
          destinationSearchController.text.trim().isEmpty &&
          dateSearchController.text.trim().isEmpty) {
        searchedFlightModelList.add(element);
      } else if (destinationSearchController.text.trim().toLowerCase() ==
          element.destination.toLowerCase() &&
          originSearchController.text.trim().isEmpty &&
          dateSearchController.text.trim().isEmpty) {
        searchedFlightModelList.add(element);
      } else if (dateSearchController.text.trim().toLowerCase() ==
          element.date.toLowerCase() &&
          destinationSearchController.text.trim().isEmpty &&
          originSearchController.text.trim().isEmpty) {
        searchedFlightModelList.add(element);
      }

      // Double search
      else if(
      originSearchController.text.trim().toLowerCase() ==
          element.origin.toLowerCase() &&
          destinationSearchController.text.trim().toLowerCase() == element.destination.toLowerCase() &&
          dateSearchController.text.trim().isEmpty
      ){
        searchedFlightModelList.add(element);

      }else if(
      originSearchController.text.trim().toLowerCase() ==
          element.origin.toLowerCase() &&
          dateSearchController.text.trim().toLowerCase() == element.date.toLowerCase() &&
          destinationSearchController.text.trim().isEmpty
      ){
        searchedFlightModelList.add(element);
      } else if(
      destinationSearchController.text.trim().toLowerCase() ==
          element.destination.toLowerCase() &&
          dateSearchController.text.trim().toLowerCase() == element.date.toLowerCase() &&
          originSearchController.text.trim().isEmpty
      ){
        searchedFlightModelList.add(element);

      }
      // Triple search
      else if(
      originSearchController.text.trim().toLowerCase() ==
          element.origin.toLowerCase() &&
          destinationSearchController.text.trim().toLowerCase() == element.destination.toLowerCase() &&
          dateSearchController.text.trim().toLowerCase() == element.date.toLowerCase() ){
        searchedFlightModelList.add(element);
      } else{
        searchText.value = "No Flight Found";
      }


    }
  }

  /// Book flight
  void bookFlight({required FlightSearchModel flightSearchModel}){
      Get.find<HomeController>().bookedFlight.add(flightSearchModel);

      Fluttertoast.showToast(
          msg: "Successfully Booked",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
      );

      originSearchController.text = "";
      destinationSearchController.text = "";
      dateSearchController.text = "";

      searchedFlightModelList.clear();

      searchText.value = "Search Flight";


  }

}
