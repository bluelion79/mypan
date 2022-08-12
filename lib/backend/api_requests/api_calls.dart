import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GetPlanSheetCall {
  static Future<ApiCallResponse> call({
    String? key = 'AIzaSyDlDNXfSvrA3UfJZ0M-nIFeujxo132G7W4',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GetPlanSheet',
      apiUrl:
          'https://sheets.googleapis.com/v4/spreadsheets/1O1gc4pdc-qY0IivU2dFuxHPYPhbwzQyKBZS0f_patFQ/values/B2:E',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': key,
      },
      returnBody: true,
    );
  }
}
