// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample/blocs/ship_bloc.dart';
import 'package:sample/constants/ship_names.dart';
import 'package:sample/repositories/ship_repository.dart';
import 'package:sample/ui/home_page.dart';

void main() {
  testWidgets('Test ship buttons', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => ShipBloc(shipRepository: ShipRepository()),
          child: HomePage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.text(ShipName.sky.name));
    await tester.pumpAndSettle();

    await tester.tap(find.text(ShipName.bliss.name));
    await tester.pumpAndSettle();

    await tester.tap(find.text(ShipName.escape.name));
    await tester.pumpAndSettle();
  });
}
