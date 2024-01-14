import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nghlong011_s_application5/presentation/apply_job_screen/ApplyJobProvider.dart';
import 'package:nghlong011_s_application5/presentation/home_page/home_page_provider.dart';
import 'package:nghlong011_s_application5/presentation/login_screen/login.dart';
import 'package:nghlong011_s_application5/presentation/search_screen/SearchProvider.dart';
import 'package:nghlong011_s_application5/presentation/sign_up_complete_account_screen/Regis.dart';
import 'package:nghlong011_s_application5/theme/theme_helper.dart';
import 'package:nghlong011_s_application5/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegistrationProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => GetJobProvider()),
        ChangeNotifierProvider(create: (context) => ApplyJobProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
      ],
      child: MaterialApp(
        theme: theme,
        title: 'nghlong011_s_application5',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.loginScreen,
        routes: AppRoutes.routes,
      ),
    );
  }
}
