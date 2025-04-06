import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AiResponseCall {
  static Future<ApiCallResponse> call({
    String? apiKey =
        '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',
    String? model = 'gpt-3.5-turbo',
    dynamic? messagesJson,
  }) async {
    final messages = _serializeJson(messagesJson, true);
    final ffApiRequestBody = '''
{
  "model": "${escapeStringForJson(model)}",
  "messages": ${messages}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'aiResponse',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${apiKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GitHubModelsAPICall {
  static Future<ApiCallResponse> call({
    String? userMessage = '',
  }) async {
    final ffApiRequestBody = '''
{
  "messages": [
    {
      "role": "system",
      "content": ""
    },
    {
      "role": "user",
      "content": "{The user is having these symptom${escapeStringForJson(userMessage)}s .give 1-3 possible causes and precautions. give 1-3 test recommnedations that is required to understand about the symtoms.Donot use any symbol in the response}"
    }
  ],
  "model": "gpt-4o",
  "temperature": 1,
  "max_tokens": 4096,
  "top_p": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'gitHubModelsAPI',
      apiUrl: 'https://models.inference.ai.azure.com/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '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',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
