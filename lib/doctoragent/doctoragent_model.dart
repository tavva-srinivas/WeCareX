import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'doctoragent_widget.dart' show DoctoragentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DoctoragentModel extends FlutterFlowModel<DoctoragentWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for txtPrompt widget.
  FocusNode? txtPromptFocusNode;
  TextEditingController? txtPromptTextController;
  String? Function(BuildContext, String?)? txtPromptTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtPromptFocusNode?.dispose();
    txtPromptTextController?.dispose();
  }
}
