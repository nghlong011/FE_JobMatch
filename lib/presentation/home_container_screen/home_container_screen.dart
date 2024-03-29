import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';

import 'package:nghlong011_s_application5/presentation/home_page/home_page.dart';
import 'package:nghlong011_s_application5/presentation/message_page/message_page.dart';
import 'package:nghlong011_s_application5/presentation/profile_page/profile_page.dart';
import 'package:nghlong011_s_application5/presentation/saved_page/saved_page.dart';

import '../../data/repository/auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore_for_file: must_be_immutable
class HomeContainerScreen extends StatefulWidget {
  HomeContainerScreen({Key? key}) : super(key: key);
  @override
  _HomeContainerScreenState createState() => _HomeContainerScreenState();
}

class _HomeContainerScreenState extends State<HomeContainerScreen> {
  int _currentIndex = 0;
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
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // Add your pages here
          HomePage(),
          SavedPage(),
          MessagePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: getVerticalSize(60),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withOpacity(0.08),
              spreadRadius: getHorizontalSize(2),
              blurRadius: getHorizontalSize(2),
              offset: Offset(
                0,
                -4,
              ),
            ),
          ],
        ),
        child: GNav(
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Trang chủ',
            ),
            GButton(
              icon: Icons.bookmark,
              text: 'Ứng tuyển',
            ),
            GButton(
              icon: Icons.message,
              text: 'Message',
            ),
            GButton(
              icon: Icons.person,
              text: 'Hồ sơ',
            ),
          ],
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          gap: 8,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          iconSize: 24, // Adjust icon size as neededAdjust gap as needed
          selectedIndex: _currentIndex,
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }

}
