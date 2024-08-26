import '../network_config.dart';

class AdminEndpoint {

  static String getHistoryProblem = NetworkConfig.getFullApiRout('Admin/getAll-repairOrder');
  static String updateOrderProblem = NetworkConfig.getFullApiRout('Admin/update-repairOrder');
  static String deleteOrderProblem = NetworkConfig.getFullApiRout('Admin/delete-repairOrder');
  static String addPark = NetworkConfig.getFullApiRout('Admins/addPark');
  static String adminlogin = NetworkConfig.getFullApiRout('Admins/Adminlogin');
  static String getparks = NetworkConfig.getFullApiRout('Admins/getParks');
  static String editPark = NetworkConfig.getFullApiRout('Admins/editPark');
  static String settigns = NetworkConfig.getFullApiRout('Admins/settigns');
  static String countAllPark = NetworkConfig.getFullApiRout('Statiscs/numberofparks');
  static String totalRevenu = NetworkConfig.getFullApiRout('Statiscs/totalRevenu');
  static String numberoflocationbypark = NetworkConfig.getFullApiRout("Statiscs/numberoflocationbypark");
  static String TotalRevenueByPark = NetworkConfig.getFullApiRout("Statiscs/TotalRevenueByPark");
  static String repairordersbyproblem = NetworkConfig.getFullApiRout("Statiscs/RepairOrdersByproblem");
}