import 'package:get/get.dart';
import 'package:base_getx/pages/pages.dart';

class Routes {
  static const splash = '/SPLASH';
  static const signIn = '/SIGN_IN';
  static const signUp = '/SIGN_UP';
  static const otp = '/OTP';

  static const root = '/';

  static const profile = '/PROFILE';
}

class AppPages {
  static String initPage = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: BindingsBuilder.put(() => SplashController()),
    ),
    GetPage(
      name: Routes.signIn,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.root,
      page: () => const RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.otp,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
