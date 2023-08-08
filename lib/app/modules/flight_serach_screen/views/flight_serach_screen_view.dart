import 'package:deep_byte_flight_booking/app/data/size.dart';
import 'package:deep_byte_flight_booking/app/models/flight_search_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/flight_serach_screen_controller.dart';

class FlightSerachScreenView extends GetView<FlightSerachScreenController> {
  const FlightSerachScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  /// Body
  Widget _body() {
    return Container(
      margin: EdgeInsets.only(
        top: height * 0.06,
        left: width * 0.03,
        right: width * 0.03,
        bottom: height * 0.03,
      ),
      child: Column(
        children: [
          // Search fields
          searchFieldsWidget(),

          // Search result
          _resultListWidget(),
        ],
      ),
    );
  }

  Expanded _resultListWidget() {
    return Expanded(
          child: Obx(() => controller.searchedFlightModelList.isEmpty ?  Center(child: Text(controller.searchText.value,
          style: const TextStyle(fontSize: 28),
          ),) :ListView.builder(
            itemCount: controller.searchedFlightModelList.length,
            itemBuilder: (context, index) {
                return searchedFlightResultWidget(
                    controller.searchedFlightModelList[index]);
            },
          ),)
        );
  }

  /// Searched flight widget
  Widget searchedFlightResultWidget(FlightSearchModel flightSearchModel) {
    return GestureDetector(
      onTap: () => controller.bookFlight(flightSearchModel: flightSearchModel),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: height * 0.01),
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
                ),
    );
  }

  /// Search fields
  Widget searchFieldsWidget() {
    return Column(
          children: [
            // Search origin
            _getTextFieldWidget(
              textEditingController: controller.originSearchController,
              labelText: "Search Origin",
              onChanged: (val) {
                controller.searchedOrigin.value = val;
              }
            ),

            SizedBox(height: height * 0.01,),

            // Search origin
            _getTextFieldWidget(
                textEditingController: controller.destinationSearchController,
                labelText: "Search Destination",
                onChanged: (val) {
                  controller.searchedDestination.value = val;
                }
            ),

            SizedBox(height: height * 0.01,),

            // Search origin
            _getTextFieldWidget(
                textEditingController: controller.dateSearchController,
                labelText: "Search Date",
                onChanged: (val) {
                  controller.searchedDate.value = val;
                }
            ),
          ],
        );
  }

  /// Common textfield widget
  Widget _getTextFieldWidget({
    required TextEditingController textEditingController,
    required String labelText,
    required Function onChanged,
  }) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        label: Text(labelText),
        border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
      ),
      onChanged:(value) => onChanged(value),
    );
  }
}
