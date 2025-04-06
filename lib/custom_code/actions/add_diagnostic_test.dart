// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> addDiagnosticTest(
  String chatId,
  String prescriptionId,
  String testName,
  String isTested,
  String? testResultJson,
) async {
  try {
    final testRef = FirebaseFirestore.instance
        .collection('Chats')
        .doc(chatId)
        .collection('prescriptions')
        .doc(prescriptionId)
        .collection('diagnosticTests')
        .doc();

    await testRef.set({
      'createdAt': FieldValue.serverTimestamp(),
      'testName': testName,
      'isTested': isTested,
      'testResults': testResultJson != null && testResultJson.isNotEmpty
          ? jsonDecode(testResultJson)
          : null,
    });

    return true;
  } catch (e) {
    return false;
  }
  // Add your function code here!
}
