import 'dart:convert';

List<FlightSearchModel> flightSearchModelFromJson(String str) => List<FlightSearchModel>.from(json.decode(str).map((x) => FlightSearchModel.fromJson(x)));

String flightSearchModelToJson(List<FlightSearchModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FlightSearchModel {
  final String id;
  final String origin;
  final String destination;
  final String date;

  FlightSearchModel({
    required this.id,
    required this.origin,
    required this.destination,
    required this.date,
  });

  factory FlightSearchModel.fromJson(Map<String, dynamic> json) => FlightSearchModel(
    id: json["id"],
    origin: json["origin"],
    destination: json["destination"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "origin": origin,
    "destination": destination,
    "date": date,
  };
}
