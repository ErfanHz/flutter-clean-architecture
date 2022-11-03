import 'package:clean_base/src/core/constants/constants.dart';

String getNetworkImageUrl(String? path){
  return
    '${Constants.domain}${'/$path'.replaceAll(r'//', '/')}';
}

class ApiUrls {

  static String sendOtp() => '${Constants.apiBaseUrl}users/sendOtp';

}
