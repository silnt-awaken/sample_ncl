part of 'ship_bloc.dart';

class ShipState extends Equatable {
  final List<ShipFacts> shipFacts;
  final String? error;
  final ShipButtonStatus buttonStatus;
  const ShipState(
      {required this.shipFacts, this.error, required this.buttonStatus});

  @override
  List<Object> get props => [shipFacts, error ?? false, buttonStatus];

  ShipState copyWith(
      {List<ShipFacts>? shipFacts,
      String Function()? error,
      ShipButtonStatus? buttonStatus}) {
    return ShipState(
      shipFacts: shipFacts ?? this.shipFacts,
      error: error != null ? error() : this.error,
      buttonStatus: buttonStatus ?? this.buttonStatus,
    );
  }
}

enum ShipButtonStatus {
  initial,
  loading,
  loaded,
  error,
}
