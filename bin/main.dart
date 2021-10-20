import 'package:sonoff/ewelink_object.dart';
import 'package:sonoff/get_region.dart';

void main(List<String> arguments) {
  EweLinkObject eweLink = EweLinkObject(email: '', password: '', region: 'as');
  print(GetRegion.getRegion(eweLink));
}
