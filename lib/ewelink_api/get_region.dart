import 'errors.dart';
import 'ewelink_object.dart';
import 'get_credentials.dart';

class GetRegion {
  static Future<Map> getRegion(EweLinkObject eweLink) async {
    if (eweLink.email == null || eweLink.password == null) {
      return {'error': 406, 'msg': errors['invalidAuth']};
    }

    Map credentials = await GetCredentials.getCredentials(eweLink);

    return {};
  }
}
