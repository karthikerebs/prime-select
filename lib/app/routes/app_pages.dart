import 'package:get/get.dart';
import 'package:omiga/app/modules/address/views/my_addresses_view.dart';
import 'package:omiga/app/modules/bottombar/bindings/bottombar_binding.dart';
import 'package:omiga/app/modules/bottombar/views/bottombar_view.dart';
import 'package:omiga/app/modules/orders/bindings/order_tracking_binding.dart';
import 'package:omiga/app/modules/orders/views/order_tracking_view.dart';
import '../modules/address/bindings/address_binding.dart';
import '../modules/address/views/address_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_view.dart';
import '../modules/details/bindings/details_binding.dart';
import '../modules/details/views/details_view.dart';
import '../modules/favourite/bindings/favourite_binding.dart';
import '../modules/favourite/views/favourite_view.dart';
import '../modules/helpAndSupport/bindings/help_and_support_binding.dart';
import '../modules/helpAndSupport/views/help_and_support_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/legalPolicies/bindings/legal_policies_binding.dart';
import '../modules/legalPolicies/views/legal_policies_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/orders/bindings/orders_binding.dart';
import '../modules/orders/views/orders_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/signup/widgets/signup_verification.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_VERIFICATION,
      page: () => const SignupVerification(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => const DetailsView(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainPage(),
      binding: BottombarBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS,
      page: () => const AddressView(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: _Paths.FAVOURITE,
      page: () => const FavouriteView(),
      binding: FavouriteBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ORDERS,
      page: () => const OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: _Paths.HELP_AND_SUPPORT,
      page: () => const HelpAndSupportView(),
      binding: HelpAndSupportBinding(),
    ),
    GetPage(
      name: _Paths.LEGAL_POLICIES,
      page: () => const LegalPoliciesView(),
      binding: LegalPoliciesBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_TRACKING,
      page: () => const OrderTrackingView(),
      binding: OrderTrackingBinding(),
    ),
    GetPage(
      name: _Paths.MY_ADDRESSES,
      page: () => const MyAddressesView(),
      binding: AddressBinding(),
    ),
  ];
}
