import 'package:get/get.dart';
import 'models/nav_data.dart';

class RootController extends GetxController {
  final _navData = NavData();

  List<NavItemData> get navBarData => _navData.myNavData;

  final indexNavBar = 2.obs;

  //onChange page bottomNavigationBar.
  void onTapNav(int index) => indexNavBar.value = index;
}
