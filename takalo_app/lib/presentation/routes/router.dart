import 'package:auto_route/auto_route.dart';
import 'package:takalo_app/presentation/pages/HomeWithSidebar.dart';
import 'package:takalo_app/presentation/pages/login.dart';
import 'package:takalo_app/presentation/pages/cart_list.dart';
import 'package:takalo_app/presentation/pages/homapage.dart';
import 'package:takalo_app/presentation/pages/wallet_home.dart';
import 'package:takalo_app/presentation/pages/wallet_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Authentication, initial: true),
    AutoRoute(page: HomePage),
    AutoRoute(page: CartList),
    AutoRoute(page: WalletHome),
    AutoRoute(page: HomeWallet),
    AutoRoute(page: HomeWithSidebar),
  ],
)
class $AppRouter {}
