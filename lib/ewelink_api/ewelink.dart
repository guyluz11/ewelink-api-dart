import 'dart:convert';

import 'package:crypto/crypto.dart';

class Ewelink {
  static String makeAuthorizationSign(
      String appSecret, Map<String, Object> body) {
    var bytes = utf8.encode("foobar"); // data being hashed

    var digest = sha256.convert(bytes);

    print("Digest as bytes: ${digest.bytes}");
    print("Digest as hex string: $digest");
    // crypto
    //     .createHmac('sha256', APP_SECRET)
    //     .update(JSON.stringify(body))
    //     .digest('base64');
    return 'error';
  }
}
