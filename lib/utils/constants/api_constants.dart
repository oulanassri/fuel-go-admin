/* -- LIST OF Constants used in APIs -- */

class APIConstants {
  static final String baseUrl = "http://172.201.110.216:5000";

  static _EndPoints endPoints=_EndPoints();

}
class _EndPoints{
  final String login="/api/User/login";//True
  final String editPassword="/api/User/edit-password";

  final String addTruck="/api/Admin/add-truck";//?
  final String addDriver="/api/Admin/add-driver";//?
  final String editFuelPrice="/api/Admin/edit-fuel-price";
  final String getShifts="/api/Admin/get-shifts";//True
  final String getOrdersByCenter="/api/Admin/get-orders-by-center";//?
  final String getDrivers="/api/Admin/get-drivers";//True
  final String getTrucks="/api/Admin/get-trucks";//True

  //Wallet
  final String chargeWallet="/api/Wallet/charge-wallet";//?

  final String getFuelDetails = "/api/FuelDetails/get-fuel-details";//GET True

}