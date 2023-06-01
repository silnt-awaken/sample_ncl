import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample/constants/ship_names.dart';
import 'package:sample/models/ship_facts.dart';
import 'package:sample/repositories/ship_repository.dart';

part 'ship_event.dart';
part 'ship_state.dart';

class ShipBloc extends Bloc<ShipEvent, ShipState> {
  final ShipRepository shipRepository;
  ShipBloc({required this.shipRepository})
      : super(const ShipState(
            shipFacts: [], buttonStatus: ShipButtonStatus.initial)) {
    on<ShipEventInit>((event, emit) async {
      emit(state.copyWith(buttonStatus: ShipButtonStatus.loading));
      try {
        for (ShipName shipName in ShipName.values) {
          ShipFacts shipFacts =
              await shipRepository.fetchShipFacts(shipName.name.toUpperCase());
          emit(state.copyWith(
              shipFacts: [...state.shipFacts, shipFacts],
              buttonStatus: ShipButtonStatus.loaded));
        }
      } catch (e) {
        emit(state.copyWith(shipFacts: [], error: () => e.toString()));
      }
    });

    on<ShipEventFetchShipFacts>((event, emit) async {
      emit(state.copyWith(buttonStatus: ShipButtonStatus.loading));
      try {
        final shipList = List.of(state.shipFacts);
        if (shipList.any((element) => element.shipName == event.shipName)) {
          emit(state.copyWith(shipFacts: state.shipFacts));
          return;
        }

        ShipFacts shipFacts =
            await shipRepository.fetchShipFacts(event.shipName);

        shipList.add(shipFacts);

        emit(state.copyWith(
            shipFacts: shipList, buttonStatus: ShipButtonStatus.loaded));
      } catch (e) {
        emit(state.copyWith(
            shipFacts: state.shipFacts,
            error: () => e.toString(),
            buttonStatus: ShipButtonStatus.error));
      }
    });
  }
}
