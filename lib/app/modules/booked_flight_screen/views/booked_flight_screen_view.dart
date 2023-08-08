import 'package:deep_byte_flight_booking/app/data/size.dart';
import 'package:deep_byte_flight_booking/app/models/flight_search_model.dart';
import 'package:deep_byte_flight_booking/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booked_flight_screen_controller.dart';

class BookedFlightScreenView extends GetView<BookedFlightScreenController> {
  const BookedFlightScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  /// Body
  Widget _body(){
    return ListView.builder(
      itemCount: Get.find<HomeController>().bookedFlight.length,
      itemBuilder: (context, index){
        return bookedFlightResultWidget(Get.find<HomeController>().bookedFlight[index]);
      },
    );
  }

  /// Booked flight widget
  Widget bookedFlightResultWidget(FlightSearchModel flightSearchModel) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width *0.03 ,vertical: height * 0.01),
      padding: EdgeInsets.all( height * 0.01),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [

          const Icon(Icons.flight, size: 30,),

          SizedBox(width: width * 0.02,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Flight Details", style: TextStyle(fontSize: 25),),

              SizedBox(height: height * 0.01,),

              Row(
                children: [
                  const Text("Origin :  ", style: TextStyle(fontSize: 20),),
                  Text(flightSearchModel.origin, style: const TextStyle(fontSize: 20),),
                ],
              ),

              SizedBox(height: height * 0.01,),

              Row(
                children: [
                  const Text("Destination :  ", style: TextStyle(fontSize: 20),),

                  Text(flightSearchModel.destination, style: const TextStyle(fontSize: 20),),
                ],
              ),
              SizedBox(height: height * 0.01,),

              Row(
                children: [
                  const Text("Date :  ", style: TextStyle(fontSize: 20),),

                  Text(flightSearchModel.date, style: const TextStyle(fontSize: 20),),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
