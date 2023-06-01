import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ShipBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('$bloc $change');
    super.onChange(bloc, change);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  Bloc.observer = ShipBlocObserver();
  runApp(await builder());
}
