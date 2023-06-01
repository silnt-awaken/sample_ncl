import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/constants/ship_names.dart';
import 'package:sample/models/ship_facts.dart';

import '../blocs/ship_bloc.dart';

class ShipButton extends StatelessWidget {
  final ShipName shipName;
  const ShipButton({required this.shipName, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShipBloc, ShipState>(
      listener: (context, state) {
        if (state.buttonStatus == ShipButtonStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
            ),
          );
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          child: Text(shipName.name),
          onPressed: () {
            if (state.buttonStatus == ShipButtonStatus.loading) {
              return;
            }

            if (state.shipFacts
                .any((element) => element.shipName != shipName.fullName)) {
              context.read<ShipBloc>().add(
                    ShipEventFetchShipFacts(shipName.name),
                  );
            }

            _showShipFactsDialog(
                context,
                state.shipFacts.firstWhere(
                    (element) => element.shipName == shipName.fullName));
          },
        );
      },
    );
  }

  void _showShipFactsDialog(BuildContext context, ShipFacts shipFacts) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(shipFacts.shipName),
          content: Column(
            children: <Widget>[
              Text('Passenger Capacity: ${shipFacts.passengerCapacity}'),
              Text('Crew: ${shipFacts.crew}'),
              Text('Inaugural Date: ${shipFacts.inauguralDate}'),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
