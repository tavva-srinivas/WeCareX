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

Future<bool> addMedication(
  String chatId,
  String prescriptionId,
  String medicineName,
  String reason,
  String schedule,
  String duration,
) async {
  try {
    final medRef = FirebaseFirestore.instance
        .collection('Chats')
        .doc(chatId)
        .collection('prescriptions')
        .doc(prescriptionId)
        .collection('medications')
        .doc();

    await medRef.set({
      'createdAt': FieldValue.serverTimestamp(),
      'medicineName': medicineName,
      'reason': reason,
      'schedule': schedule,
      'duration': duration,
    });

    return true;
  } catch (e) {
    return false;
  }
  // Add your function code here!
}
