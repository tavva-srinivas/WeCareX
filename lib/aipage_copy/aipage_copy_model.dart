import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'aipage_copy_widget.dart' show AipageCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AipageCopyModel extends FlutterFlowModel<AipageCopyWidget> {
  ///  Local state fields for this page.

  List<MessagesStruct> messages = [];
  void addToMessages(MessagesStruct item) => messages.add(item);
  void removeFromMessages(MessagesStruct item) => messages.remove(item);
  void removeAtIndexFromMessages(int index) => messages.removeAt(index);
  void insertAtIndexInMessages(int index, MessagesStruct item) =>
      messages.insert(index, item);
  void updateMessagesAtIndex(int index, Function(MessagesStruct) updateFn) =>
      messages[index] = updateFn(messages[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for userInput widget.
  FocusNode? userInputFocusNode;
  TextEditingController? userInputTextController;
  String? Function(BuildContext, String?)? userInputTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button-APIcall widget.
  MessagesRecord? inputMsg;
  // Stores action output result for [Backend Call - API (gitHubModelsAPI)] action in Button-APIcall widget.
  ApiCallResponse? apiResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userInputFocusNode?.dispose();
    userInputTextController?.dispose();
  }
}
