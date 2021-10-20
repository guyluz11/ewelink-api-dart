import 'package:http/http.dart' as http;

import 'credentials_payload.dart';
import 'ewelink.dart';
import 'ewelink_object.dart';

class GetCredentials {
  static Future<Map> getCredentials(EweLinkObject eweLink) async {
    Map<String, Object> body = await CredentialsPayload.credentialsPayload(
      appid: eweLink.appId!,
      email: eweLink.email!,
      phoneNumber: eweLink.phoneNumber!,
      password: eweLink.password!,
    );
    final Uri url = Uri.parse('${eweLink.getApiUrl()}/user/login');

    await http.post(
      url,
      headers: {
        'Authorization':
            'Sign ${Ewelink.makeAuthorizationSign(eweLink.appSecret!, body)}'
      },
    );

    return body;
  }
}
