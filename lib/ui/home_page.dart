import 'package:flutter/material.dart';
import 'package:sample/constants/ship_names.dart';
import 'package:sample/repositories/ship_repository.dart';
import 'package:sample/widgets/ship_button.dart';
import '../blocs/ship_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final ShipRepository shipService = ShipRepository();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShipBloc(shipRepository: ShipRepository())
        ..add(const ShipEventInit()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ship Facts'),
          centerTitle: true,
        ),
        body: Center(
          child: BlocBuilder<ShipBloc, ShipState>(
            builder: (context, shipState) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ShipButton(shipName: ShipName.sky),
                  ShipButton(shipName: ShipName.bliss),
                  ShipButton(shipName: ShipName.escape),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
