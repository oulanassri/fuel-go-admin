import 'package:admin_fuel_go/screens/drivers_management/driver_details_screen.dart';
import 'package:admin_fuel_go/screens/orders/orders_upcoming.dart';
import 'package:get/get.dart';

import '../getx_bindings/dashboard_binding.dart';
import '../getx_bindings/drivers_binding.dart';
import '../getx_bindings/login_binding.dart';
import '../getx_bindings/lorries_binding.dart';
import '../getx_bindings/main_binding.dart';
import '../getx_bindings/orders_binding.dart';
import '../getx_bindings/settings_binding.dart';
import '../getx_bindings/shifts_binding.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/drivers_management/components/driver_details.dart';
import '../screens/drivers_management/drivers_management_screen.dart';
import '../screens/drivers_management/new_driver_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/lorries_mangement/lorries_mangement_screen.dart';
import '../screens/lorries_mangement/lorry_details_screen.dart';
import '../screens/lorries_mangement/new_lorry_screen.dart';
import '../screens/main/main_screen.dart';
import '../screens/orders/order_details.dart';
import '../screens/orders/orders_cancelled.dart';
import '../screens/orders/orders_completed.dart';
import '../screens/orders/orders_inprogress.dart';
import '../screens/settings/components/edit_service_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/shifts_management/shifts_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;
  static final routes = [
    //Dashboard
    GetPage(
        name: Paths.DASHBOARD,
        page: () => const DashboardScreen(),
        binding: DashboardBinding()),
    //Lorries Management
    GetPage(
        name: Paths.LORRIES_MANAGEMENT,
        page: () => LorriesManagementScreen(),
        binding: LorriesBinding()),
    //new lorry screen
    GetPage(
        name: Paths.NEW_LORRY,
        page: () => NewLorryScreen(),
        binding: LorriesBinding()),
    //lorry details screen
    GetPage(
        name: Paths.LORRY_DETAILS_SCREEN,
        page: () => LorryDetailsScreen(),
        binding: LorriesBinding()),
    //Main Screen
    GetPage(
        name: Paths.MAIN_SCREEN,
        page: () => MainScreen(),
        binding: MainBinding()),

    //Login Screen
    GetPage(
        name: Paths.LOGIN,
        page: () => LoginScreen(),
        binding: LoginBinding()),

    //Drivers Management
    GetPage(
        name: Paths.DRIVERS_MANAGEMENT,
        page: () => DriversManagementScreen(),
        binding: DriversBinding()),
    //New Driver Screen
    GetPage(
        name: Paths.NEW_DRIVER,
        page: () => NewDriverScreen(),
        binding: DriversBinding()),
    //Driver Details
    GetPage(
        name: Paths.DRIVER_DETAILS_SCREEN,
        page: () => DriverDetailsScreen(),
        binding: DriversBinding()),

    //Orders Screens
    GetPage(
        name: Paths.ORDERS_UPCOMING_SCREEN,
        page: () => UpcomingOrdersScreen(),
        binding: OrdersBinding()),
    GetPage(
        name: Paths.ORDERS_INPROGRESS_SCREEN,
        page: () => InProgressOrdersScreen(),
        binding: OrdersBinding()),
    GetPage(
        name: Paths.ORDERS_CANCELLED_SCREEN,
        page: () => CancelledOrdersScreen(),
        binding: OrdersBinding()),
    GetPage(
        name: Paths.ORDERS_COMPLETED_SCREEN,
        page: () => CompletedOrdersScreen(),
        binding: OrdersBinding()),

    //Order Details Screen
    GetPage(
        name: Paths.ORDER_DETAILS,
        page: () => OrderDetails(),
        binding: OrdersBinding()),

    //Shifts Screen
    GetPage(
        name: Paths.SHIFTS_SCREEN,
        page: () => ShiftsScreen(),
        binding: ShiftsBinding()),

    //Settings Screen
    GetPage(
        name: Paths.SETTINGS_SCREEN,
        page: () => SettingsScreen(),
        binding: SettingsBinding()),
    //Edit Service Screen
    GetPage(
        name: Paths.EDIT_SERVICE_SCREEN,
        page: () => EditServiceScreen(),
        binding: SettingsBinding()),
  ];
}
