import 'dart:math';

class CredentialsPayload {
  static Future<Map<String, Object>> credentialsPayload({
    required String appid,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    return {
      'appid': appid,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      // TODO: Check if this is the correct number of digit like in the comment
      'ts': DateTime.now().millisecondsSinceEpoch, // 1634742259
      'version': 8,

      /// TODO: fix random
      'nonce': Random(), // nyxxgjyt
      // 'nonce': Random().toString(36).slice(5), // nyxxgjyt
    };
  }
}
