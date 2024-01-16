import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nghlong011_s_application5/data/repository/auth.dart';
import 'package:nghlong011_s_application5/data/repository/update_profile.dart';
import 'package:nghlong011_s_application5/presentation/apply_job_screen/ApplyJobProvider.dart';
import 'package:nghlong011_s_application5/presentation/edit_skill_screen/edit_skill_provider.dart';
import 'package:nghlong011_s_application5/presentation/home_page/home_page_provider.dart';
import 'package:nghlong011_s_application5/presentation/home_page_employer/get_job.dart';
import 'package:nghlong011_s_application5/presentation/login_screen/login.dart';
import 'package:nghlong011_s_application5/presentation/post_job/post_job_provider.dart';
import 'package:nghlong011_s_application5/presentation/profile_page/profile_provider.dart';
import 'package:nghlong011_s_application5/presentation/saved_page/saved_page_provider.dart';
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
        ChangeNotifierProvider(create: (context) => GetJobAppProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => EditSkillProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UpdateProfile()),
        ChangeNotifierProvider(create: (context) => GetJobEmployerProvider()),
        ChangeNotifierProvider(create: (context) => PostJobProvider()),
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
