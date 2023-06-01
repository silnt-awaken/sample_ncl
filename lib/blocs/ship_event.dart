part of 'ship_bloc.dart';

abstract class ShipEvent extends Equatable {
  const ShipEvent();

  @override
  List<Object> get props => [];
}

class ShipEventInit extends ShipEvent {
  const ShipEventInit();
}

class ShipEventFetchShipFacts extends ShipEvent {
  final String shipName;

  const ShipEventFetchShipFacts(this.shipName);

  @override
  List<Object> get props => [shipName];
}
