import 'constants.dart';
import 'errors.dart';

class EweLinkObject {
  EweLinkObject({
    this.region = 'us',
    this.email,
    this.phoneNumber,
    this.password,
    this.at,
    this.apiKey,
    this.devicesCache,
    this.arpTable,
    this.appId = defaultAppId,
    this.appSecret = defaultAppSecret,
  }) {
    // bool check = checkLoginParameters();
    if (false) {
      throw (customErrors['invalidCredentials']);
    }
  }

  String region;
  String? email;
  String? phoneNumber;
  String? password;
  String? at;
  String? apiKey;
  String? devicesCache;
  String? arpTable;
  String? appId;
  String? appSecret;

  bool checkLoginParameters({
    required String region,
    required String email,
    required String phoneNumber,
    required String password,
    required String at,
    required String apiKey,
    required String devicesCache,
    required String arpTable,
  }) {
    // Only one signing method at a time?
    if (email.isNotEmpty && phoneNumber.isNotEmpty) {
      return false;
    }

    if ((email.isNotEmpty && password.isNotEmpty) ||
        (phoneNumber.isNotEmpty && password.isNotEmpty) ||
        (devicesCache.isNotEmpty && arpTable.isNotEmpty) ||
        at.isNotEmpty) {
      return true;
    }
    return false;
  }

  /// Generate eWeLink API URL
  String getApiUrl() {
    return 'https://$region-api.coolkit.cc:8080/api';
  }

  /// Generate eWeLink OTA API URL
  String getOtaUrl() {
    return 'https://$region-ota.coolkit.cc:8080/otaother';
  }

  /// Generate eWeLink WebSocket URL
  String getApiWebSocket() {
    return 'wss://$region-pconnect3.coolkit.cc:8080/api/ws';
  }

  /// Generate Zeroconf URL
  String getZeroconfUrl(device) {
    // const ip = getDeviceIP(device);
    // return 'http://$ip:8081/zeroconf';
    return 'Yes';
  }
}
