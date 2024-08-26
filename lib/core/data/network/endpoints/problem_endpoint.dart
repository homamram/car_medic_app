import 'package:car_medic/core/data/network/network_config.dart';

class ProblemEndpoint {
  static String chooseProblemType = NetworkConfig.getFullApiRout('problem/getProblemType');
  static String getRepairPlaces = NetworkConfig.getFullApiRout('problem/getRepairPlaces');
  static String choosePlace = NetworkConfig.getFullApiRout('problem/orderProblem');
  static String getHistoryProblem = NetworkConfig.getFullApiRout('orders/getReapirOrders');
  static String deleteHistoryProblem = NetworkConfig.getFullApiRout('orders/deleterepair');
}
