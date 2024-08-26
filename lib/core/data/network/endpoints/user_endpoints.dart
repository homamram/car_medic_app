import 'package:car_medic/core/data/network/network_config.dart';

class UserEndPoints {
  static String login = NetworkConfig.getFullApiRout('user/login');
  static String verifyResetPassword = NetworkConfig.getFullApiRout('user/verifyResetPassCode');
  static String resetPassword = NetworkConfig.getFullApiRout('user/resetPassword');
  static String forgetPassword = NetworkConfig.getFullApiRout('user/forgotpassword');
  static String register = NetworkConfig.getFullApiRout('user/register');
  static String verifyCode = NetworkConfig.getFullApiRout('user/sendCode');
  static String sendCode = NetworkConfig.getFullApiRout('user/verifyCode');
  static String editProfile = NetworkConfig.getFullApiRout('user/settings');
  static String getlangouges = NetworkConfig.getFullApiRout('user/getDeviceLang');
  static String pro = NetworkConfig.getFullApiRout('pro');
  static String getpro = NetworkConfig.getFullApiRout('pro/getPro');
}
