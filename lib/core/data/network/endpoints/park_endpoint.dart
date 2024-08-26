import 'package:car_medic/core/data/network/network_config.dart';

class ParkEndPoints {
  static String getClosestPark = NetworkConfig.getFullApiRout('parking/getclosestpark');
  static String choosePark = NetworkConfig.getFullApiRout('parking/getParkingSpots');
  static String chooseQRPark = NetworkConfig.getFullApiRout('parking/getSpotBycode');
  static String chooseTime = NetworkConfig.getFullApiRout('parking/bookingPark');
  static String parkingtimer = NetworkConfig.getFullApiRout('parking/HomeParkingTimer');
  static String oedercansled = NetworkConfig.getFullApiRout('parking/cancelbooking');
  static String expandtime = NetworkConfig.getFullApiRout('parking/expandParkingTime');
  static String getHistoryParking = NetworkConfig.getFullApiRout('orders/getParkingOrders');
  static String deleteHistoryPark = NetworkConfig.getFullApiRout('orders/deleteOrder');

}
