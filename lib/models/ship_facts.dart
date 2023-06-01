class ShipFacts {
  final String shipName;
  final String passengerCapacity;
  final String crew;
  final String inauguralDate;

  ShipFacts(
      {required this.shipName,
      required this.passengerCapacity,
      required this.crew,
      required this.inauguralDate});

  factory ShipFacts.fromJson(Map<String, dynamic> json) {
    return ShipFacts(
      shipName: json['shipName'],
      passengerCapacity: json['shipFacts']['passengerCapacity'],
      crew: json['shipFacts']['crew'],
      inauguralDate: json['shipFacts']['inauguralDate'],
    );
  }
}
