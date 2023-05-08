import 'package:anotherapp/main.dart' as mainapp;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'selects an image using a native file picker',
    nativeAutomation: true,
    ($) async {
      await $.pumpWidgetAndSettle(const mainapp.MyApp());

      await $('Open file picker').tap();

      expect(find.byKey(const Key('image_0')), findsNothing);

      await $.native.tap(Selector(text: 'download.jpg'));
      await $.pumpAndSettle();
      await $.pumpAndSettle();

      expect(find.byKey(const Key('image_0')), findsOneWidget);
    },
  );
}
