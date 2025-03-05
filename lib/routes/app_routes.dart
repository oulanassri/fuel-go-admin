

abstract class Routes{
  Routes._();
  static const DASHBOARD=Paths.DASHBOARD;
  static const LORRIES_MANAGEMENT=Paths.LORRIES_MANAGEMENT;
  static const MAIN_SCREEN=Paths.MAIN_SCREEN;
  static const LOGIN=Paths.LOGIN;
  static const NEW_LORRY=Paths.NEW_LORRY;
  static const LORRY_DETAILS_SCREEN=Paths.LORRY_DETAILS_SCREEN;

  static const NEW_DRIVER=Paths.NEW_DRIVER;
  static const DRIVERS_MANAGEMENT=Paths.DRIVERS_MANAGEMENT;
  static const DRIVER_DETAILS=Paths.DRIVER_DETAILS_SCREEN;

  static const ORDERS_UPCOMING_SCREEN=Paths.ORDERS_UPCOMING_SCREEN;
  static const ORDERS_INPROGRESS_SCREEN=Paths.ORDERS_INPROGRESS_SCREEN;
  static const ORDERS_COMPLETED_SCREEN=Paths.ORDERS_COMPLETED_SCREEN;
  static const ORDERS_CANCELLED_SCREEN=Paths.ORDERS_CANCELLED_SCREEN;

  static const ORDER_DETAILS=Paths.ORDER_DETAILS;

  static const SHIFTS_SCREEN=Paths.SHIFTS_SCREEN;
  static const WALLETS_SCREEN=Paths.WALLETS_SCREEN;
  static const WALLET_CHARGING_SCREEN=Paths.WALLET_CHARGING_SCREEN;
  static const SETTINGS_SCREEN=Paths.SETTINGS_SCREEN;
  static const EDIT_SERVICE_SCREEN=Paths.EDIT_SERVICE_SCREEN;

}

abstract class Paths{
  Paths._();
  static const LOGIN='/login_screen';
  static const MAIN_SCREEN='/main_screen';
  static const  DASHBOARD='/dashboard_screen';

  static const LORRIES_MANAGEMENT='/lorries_management_screen';
  static const NEW_LORRY='/new_lorry_screen';
  static const LORRY_DETAILS_SCREEN='/lorry_details_screen';

  static const DRIVERS_MANAGEMENT='/drivers_management_screen';
  static const NEW_DRIVER='/new_driver_screen';
  static const DRIVER_DETAILS_SCREEN='/driver_details_screen';

  static const ORDERS_UPCOMING_SCREEN='/orders_upcoming';
  static const ORDERS_INPROGRESS_SCREEN='/orders_inprogress';
  static const ORDERS_COMPLETED_SCREEN='/orders_completed';
  static const ORDERS_CANCELLED_SCREEN='/orders_cancelled';

  static const ORDER_DETAILS='/order_details_screen';

  static const SHIFTS_SCREEN='/shifts_screen';
  static const WALLETS_SCREEN='/wallets_screen';
  static const WALLET_CHARGING_SCREEN='/wallet_charging_screen';

  static const SETTINGS_SCREEN='/settings_screen';
  static const EDIT_SERVICE_SCREEN='/edit_service_screen';

}