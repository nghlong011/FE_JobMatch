import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';
import 'package:nghlong011_s_application5/widgets/custom_outlined_button.dart';
import 'package:nghlong011_s_application5/widgets/custom_text_form_field.dart';

import 'login.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isPasswordError = true;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 24, top: 13, right: 24, bottom: 13),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgGroup162799,
                              height: getSize(24),
                              width: getSize(24),
                              alignment: Alignment.centerLeft,
                              onTap: () {
                                onTapImgImage(context);
                              }),
                          Padding(
                              padding: getPadding(top: 44),
                              child: Text("Đăng nhập",
                                  style: theme.textTheme.headlineSmall)),
                          Padding(
                              padding: getPadding(left: 33, top: 26, right: 20),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: getPadding(top: 8, bottom: 8),
                                        child: SizedBox(
                                            width: getHorizontalSize(62),
                                            child: Divider())),
                                    Padding(
                                        padding: getPadding(top: 8, bottom: 8),
                                        child: SizedBox(
                                            width: getHorizontalSize(74),
                                            child: Divider(
                                                indent: getHorizontalSize(12))))
                                  ])),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: getPadding(top: 28),
                                  child: Text("Email",
                                      style: theme.textTheme.titleSmall))),
                          CustomTextFormField(
                              controller: emailController,
                              margin: getMargin(top: 9),
                              hintText: "Nhập email",
                              hintStyle:
                                  CustomTextStyles.titleMediumBluegray400,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.emailAddress,
                              contentPadding: getPadding(
                                  left: 12, top: 15, right: 12, bottom: 15)),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: getPadding(top: 28),
                                  child: Text("Password",
                                      style: theme.textTheme.titleSmall))),
                          CustomTextFormField(
                              obscureText: isPasswordError,
                              onFieldSubmitted: (value) {
                                final String email =
                                    emailController.text;
                                final String password = value;

                                if (password.isNotEmpty) {
                                  final userData = {
                                    'email': email,
                                    'password': password,
                                  };
                                  Provider.of<LoginProvider>(context,
                                      listen: false)
                                      .loginUser(userData, context);
                                } else {
                                  // Hiển thị thông báo hoặc xử lý khi mật khẩu không hợp lệ
                                  print('Invalid password');
                                }
                              },
                              controller: passwordController,
                              margin: getMargin(top: 9),
                              hintText: "Nhập mật khẩu",
                              hintStyle:
                                  CustomTextStyles.titleMediumBluegray400,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              suffix: Container(
                                  margin: getMargin(
                                      left: 30, top: 14, right: 16, bottom: 14),
                                  child: CustomImageView(
                                      onTap: (){
                                        setState(() {
                                          isPasswordError = !isPasswordError;
                                        });
                                      },
                                      svgPath: ImageConstant.imgCheckmark)),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(52)),
                              contentPadding:
                                  getPadding(left: 16, top: 15, bottom: 15)),
                          Consumer<LoginProvider>(
                              builder: (context, loginProvider, _) {
                            return CustomElevatedButton(
                                onTap: loginProvider.isLoading
                                    ? null
                                    : () {
                                        final String email =
                                            emailController.text;
                                        final String password =
                                            passwordController.text;

                                        if (password.isNotEmpty) {
                                          final userData = {
                                            'email': email,
                                            'password': password,
                                          };
                                          Provider.of<LoginProvider>(context,
                                                  listen: false)
                                              .loginUser(userData, context);
                                        } else {
                                          // Hiển thị thông báo hoặc xử lý khi mật khẩu không hợp lệ
                                          print('Invalid password');
                                        }
                                      },
                                text: "Đăng Nhập",
                                margin: getMargin(top: 40),
                                buttonStyle: CustomButtonStyles.fillPrimary);
                          }),
                          Padding(
                              padding: getPadding(left: 41, top: 26, right: 41),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: getPadding(bottom: 1),
                                        child: Text("Bạn không có tài khoản?",
                                            style: CustomTextStyles
                                                .titleMediumBluegray300)),
                                    GestureDetector(
                                        onTap: () {
                                          onTapTxtLargelabelmediu(context);
                                        },
                                        child: Padding(
                                            padding: getPadding(left: 0),
                                            child: Text(" Đăng ký",
                                                style: theme
                                                    .textTheme.titleMedium)))
                                  ])),
                          Container(
                              width: getHorizontalSize(245),
                              margin: getMargin(top: 84),
                              child: Center(
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text:
                                              "Bằng cách đăng ký bạn đồng ý với ",
                                          style: CustomTextStyles
                                              .titleSmallBluegray400SemiBold),
                                      TextSpan(
                                          text: "Thoả thuận",
                                          style: CustomTextStyles
                                              .titleSmallErrorContainer),
                                      TextSpan(
                                          text: " và ",
                                          style: CustomTextStyles
                                              .titleSmallBluegray400SemiBold),
                                      TextSpan(
                                          text:
                                              "Điều khoản sử dụng của chúng tôi",
                                          style: CustomTextStyles
                                              .titleSmallErrorContainer)
                                    ]),
                                    textAlign: TextAlign.center),
                              ))
                        ])))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapImgImage(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the signUpCompleteAccountScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the signUpCompleteAccountScreen.
  onTapTxtLargelabelmediu(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.jobTypeScreen);
  }
}
