import 'package:deep_byte_flight_booking/app/data/size.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _body(),
    );
  }

  /// Body
  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Welcome to Flight Booking App", style: TextStyle(fontSize: 30),textAlign: TextAlign.center),

        SizedBox(height: height * 0.05,),

        MaterialButton(onPressed: controller.navigateToFlightSearchScreen,
        color: Colors.black,
        textColor: Colors.white,
        child: const Text("Book Flight"),
        ),

        SizedBox(height: height * 0.05,),

        Visibility(
          visible: controller.bookedFlight.isNotEmpty,
          child: MaterialButton(onPressed: controller.navigateToBookedFlightScreen,
            color: Colors.black,
            textColor: Colors.white,
            child: const Text("Booked flights"),
          ),
        )

      ],
    );
  }
}
