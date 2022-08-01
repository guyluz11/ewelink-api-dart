import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sonoff/sonff_diy_api/sonoff_diy_api_device_abstract.dart';

class SonoffDiyApiWallSwitch extends SonoffApiDeviceAbstract {
  SonoffDiyApiWallSwitch({
    required super.ipAddress,
    required super.port,
    required super.hostName,
  });

  Future<String> switchOn() async {
    var url = Uri.parse('$baseUrl/zeroconf/switch');
    var body = '''
{
    "deviceid": "$deviceId",
    "data": {
        "switch": "on"
       }
}
        ''';

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    http.Response response = await http.post(url, body: body, headers: headers);
    final responseJson = json.decode(response.body);
    print(responseJson);

    return responseJson;
  }

  Future<String> switchOff() async {
    var url = Uri.parse('$baseUrl/zeroconf/switch');
    var body = '''
{
    "deviceid": "$deviceId",
    "data": {
        "switch": "off"
       }
}
        ''';

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    http.Response response = await http.post(url, body: body, headers: headers);
    final responseJson = json.decode(response.body);
    print(responseJson);

    return responseJson;
  }
}
