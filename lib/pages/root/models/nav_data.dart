abstract class NavKeys {
  static const int notice = 0;
  static const int report = 1;
  static const int home = 2;
  static const int unit = 3;
  static const int user = 4;
}

class NavItemData {
  final int idNav;
  final String name;
  final String icon;

  NavItemData({
    required this.idNav,
    required this.name,
    required this.icon,
  });
}

class NavData {
  final List<NavItemData> myNavData = [
    NavItemData(
      idNav: NavKeys.notice,
      name: 'navbar_notice',
      icon: 'assets/icons/ic_notice.png',
    ),
    NavItemData(
      idNav: NavKeys.report,
      name: 'navbar_report',
      icon: 'assets/icons/ic_report.png',
    ),
    NavItemData(
      idNav: NavKeys.home,
      name: 'navbar_home',
      icon: 'assets/icons/ic_home.png',
    ),
    NavItemData(
      idNav: NavKeys.unit,
      name: 'navbar_unit',
      icon: 'assets/icons/ic_unit.png',
    ),
    NavItemData(
        idNav: NavKeys.user,
        name: 'navbar_user',
        icon: 'assets/icons/ic_user.png',
    ),
  ];
}
