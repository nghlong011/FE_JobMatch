import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/presentation/login_screen/login_screen.dart';
import 'package:nghlong011_s_application5/presentation/message_page/message_page.dart';
import 'package:nghlong011_s_application5/presentation/profile_page/profile_page.dart';
import 'package:nghlong011_s_application5/widgets/custom_bottom_bar.dart';

import '../../data/repository/auth.dart';
import '../add_new_education_screen/add_new_education_screen.dart';
import '../home_page_employer/home_page_employer.dart';
import '../new_position_screen/new_position_screen.dart';
import '../post_job/post_job.dart';
import '../read_cv/read_cv.dart';

// ignore_for_file: must_be_immutable
class HomeContainerEmployerScreen extends StatefulWidget {
  HomeContainerEmployerScreen({Key? key}) : super(key: key);

  @override
  _HomeContainerEmployerScreenState createState() => _HomeContainerEmployerScreenState();
}

class _HomeContainerEmployerScreenState extends State<HomeContainerEmployerScreen> {
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
          initialRoute: AppRoutes.homePageE,
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
        return AppRoutes.homePageE;
      case BottomBarEnum.Message:
        return AppRoutes.messagePage;
      case BottomBarEnum.Company:
        return AppRoutes.postPage;
      case BottomBarEnum.Saved:
        return AppRoutes.profilePage;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePageE:
        return HomePageEmployer();
      case AppRoutes.messagePage:
        return MessagePage();
      case AppRoutes.postPage:
        return PostJobScreen();
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
