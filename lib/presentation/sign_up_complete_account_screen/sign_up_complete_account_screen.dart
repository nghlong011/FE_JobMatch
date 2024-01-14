import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';
import 'package:nghlong011_s_application5/widgets/custom_text_form_field.dart';

import 'Regis.dart';


// ignore_for_file: must_be_immutable
class SignUpCompleteAccountScreen extends StatelessWidget {
  SignUpCompleteAccountScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isPasswordError = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgGroup162799,
                              height: getSize(24),
                              width: getSize(24),
                              onTap: () {
                                onTapImgImage(context);
                              }),
                          Align(
                              child: Padding(
                                  padding: getPadding(top: 47, right: 15),
                                  child: Text("Đăng ký tài khoản",
                                      style: theme.textTheme.headlineSmall))),
                          Padding(
                              padding: getPadding(top: 33),
                              child: Text("Họ và tên",
                                  style: theme.textTheme.titleSmall)),
                          CustomTextFormField(
                              controller: nameController,
                              margin: getMargin(top: 9),
                              hintText: "Nhập họ và tên",
                              hintStyle:
                                  CustomTextStyles.titleMediumBluegray400,
                              contentPadding: getPadding(
                                  left: 12, top: 15, right: 12, bottom: 15)),
                          Padding(
                              padding: getPadding(top: 18),
                              child: Text("Email",
                                  style: theme.textTheme.titleSmall)),
                          CustomTextFormField(
                              controller: emailController,
                              margin: getMargin(top: 9),
                              hintText: "Nhập email",
                              hintStyle:
                                  CustomTextStyles.titleMediumBluegray400,
                              contentPadding: getPadding(
                                  left: 12, top: 15, right: 12, bottom: 15)),
                          Padding(
                              padding: getPadding(top: 18),
                              child: Text("Password",
                                  style: theme.textTheme.titleSmall)),
                          CustomTextFormField(
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
                                      svgPath: ImageConstant.imgCheckmark)),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(52)),
                              obscureText: true,
                              contentPadding:
                                  getPadding(left: 16, top: 15, bottom: 15)),
                          Consumer<RegistrationProvider>(
                              builder: (context, registrationProvider, _) {
                            return CustomElevatedButton(
                                onTap: registrationProvider.isLoading
                                    ? null
                                    : () {
                                        final String email =
                                            emailController.text;
                                        final String password =
                                            passwordController.text;

                                        // if (password.isNotEmpty && isValidPassword(password)) {
                                          final userData = {
                                            'email': email,
                                            'password': password,
                                            'role': "ROLE_JOB_SEEKER"
                                          };
                                          Provider.of<RegistrationProvider>(
                                                  context,
                                                  listen: false)
                                              .registerUser(userData, context);
                                        // } else {
                                        //   // Hiển thị thông báo hoặc xử lý khi mật khẩu không hợp lệ
                                        //   print('Invalid password');
                                        // }
                                      },
                                text: "Đăng Ký",
                                margin: getMargin(top: 40),
                                buttonStyle: CustomButtonStyles.fillPrimary);
                          }),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding:
                                      getPadding(left: 40, top: 28, right: 40),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Bạn đã có tài khoản?",
                                            style: CustomTextStyles
                                                .titleMediumBluegray300),
                                        GestureDetector(
                                            onTap: () {
                                              onTapTxtLargelabelmediu(context);
                                            },
                                            child: Padding(
                                                padding: getPadding(left: 3),
                                                child: Text(" Đăng nhập",
                                                    style: theme.textTheme
                                                        .titleMedium)))
                                      ]))),
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width: getHorizontalSize(245),
                                  margin: getMargin(
                                      left: 40, top: 19, right: 40, bottom: 5),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "Bằng cách đăng ký bạn đồng ý với các ",
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
                                            text: "Điều kiện sử dụng",
                                            style: CustomTextStyles
                                                .titleSmallErrorContainer)
                                      ]),
                                      textAlign: TextAlign.center)))
                        ]))
            )
        )
    );
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapImgImage(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the loginScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the loginScreen.
  onTapTxtLargelabelmediu(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}
