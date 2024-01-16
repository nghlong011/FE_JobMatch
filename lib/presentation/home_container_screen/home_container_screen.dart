import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/presentation/home_page/home_page.dart';
import 'package:nghlong011_s_application5/presentation/login_screen/login_screen.dart';
import 'package:nghlong011_s_application5/presentation/message_page/message_page.dart';
import 'package:nghlong011_s_application5/presentation/profile_page/profile_page.dart';
import 'package:nghlong011_s_application5/presentation/saved_page/saved_page.dart';
import 'package:nghlong011_s_application5/widgets/custom_bottom_bar.dart';

import '../../data/repository/auth.dart';
import '../add_new_education_screen/add_new_education_screen.dart';
import '../company_page/company_page.dart';
import '../new_position_screen/new_position_screen.dart';

// ignore_for_file: must_be_immutable
class HomeContainerScreen extends StatefulWidget {
  HomeContainerScreen({Key? key}) : super(key: key);

  @override
  _HomeContainerScreenState createState() => _HomeContainerScreenState();
}

class _HomeContainerScreenState extends State<HomeContainerScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  bool? receivedLoggedIn;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String? token = await getToken();
      Map<String, dynamic>? decodedToken = JwtDecoder.decode(token!);

      String? userName = decodedToken['sub'];
      String? role = decodedToken['jti'];

      print('User Name: $userName');
      print('role: $role');
      bool isLoggedIn = Provider.of<AuthProvider>(context, listen: false).isLoggedIn;
      receivedLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    receivedLoggedIn = Provider.of<AuthProvider>(context, listen: false).isLoggedIn;
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA70001,
        body: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.homePage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, ani, ani1) => getCurrentPage(routeSetting.name!),
            transitionDuration: Duration(seconds: 0),
          ),
        ),
        bottomNavigationBar: receivedLoggedIn! ? CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            navigatorKey.currentState!.pushNamed(getCurrentRoute(type));
          },
        ): null,
      ),
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Company:
        return AppRoutes.companyPage;
      case BottomBarEnum.Message:
        return AppRoutes.messagePage;
      case BottomBarEnum.Saved:
        return AppRoutes.savedPage;
      case BottomBarEnum.Profile:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      case AppRoutes.companyPage:
        return CompanyPage();
      case AppRoutes.messagePage:
        return MessagePage();
      case AppRoutes.savedPage:
        return SavedPage();
      case AppRoutes.profilePage:
        return ProfilePage();
      case AppRoutes.loginScreen:
        return LoginScreen();
      case AppRoutes.newPositionScreen:
        return NewPositionScreen();
      case AppRoutes.addNewEducationScreen:
        return AddNewEducationScreen();
      default:
        return DefaultWidget();
    }
  }
}
