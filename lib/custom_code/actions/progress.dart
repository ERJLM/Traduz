// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> progress() async {
  // make progres text like 65% it must change 1% evry 10 milesicunds

  int progress = 0;

  while (progress <= 100) {
    await Future.delayed(Duration(milliseconds: 30));
    progress++;
    FFAppState().progress == '$progress%';
  }

  return 'Progress completed!';
}
