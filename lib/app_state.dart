import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _userID = '';
  String get userID => _userID;
  set userID(String value) {
    _userID = value;
  }

  String _status = '';
  String get status => _status;
  set status(String value) {
    _status = value;
  }

  DocumentReference? _ChatID;
  DocumentReference? get ChatID => _ChatID;
  set ChatID(DocumentReference? value) {
    _ChatID = value;
  }
}
