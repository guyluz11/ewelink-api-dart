import 'package:network_tools/network_tools.dart';
import 'package:sonoff/sonff_diy_api/sonoff_diy_api_wall_switch.dart';

Future<void> main(List<String> arguments) async {
  for (final ActiveHost activeHost in await MdnsScanner.searchMdnsDevices()) {
    final MdnsInfo? mdnsInfo = activeHost.mdnsInfo;

    if (mdnsInfo != null && mdnsInfo.mdnsServiceType == '_ewelink._tcp') {
      print(
        'Address: ${activeHost.address}, Port: ${mdnsInfo.mdnsPort}, ServiceType: ${mdnsInfo.mdnsServiceType}, MdnsName: ${mdnsInfo.getOnlyTheStartOfMdnsName()}',
      );
      SonoffDiyApiWallSwitch sonoffApi = SonoffDiyApiWallSwitch(
          ipAddress: activeHost.address,
          port: mdnsInfo.mdnsPort,
          hostName: mdnsInfo.getOnlyTheStartOfMdnsName());
      await sonoffApi.switchOn();
      await sonoffApi.switchOff();
    }
  }
}
