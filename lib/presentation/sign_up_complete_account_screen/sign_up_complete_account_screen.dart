import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';
import 'package:nghlong011_s_application5/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

import 'Regis.dart';

String? validatePassword(String value) {
  if (value.isEmpty) {
    return 'Bạn chưa điền mật khẩu';
  }
  if (value.length < 8) {
    return 'Mật khẩu phải có ít nhất 8 ký tự ';
  }
  final hasUppercase = value.contains(RegExp(r'[A-Z]'));
  final hasLowercase = value.contains(RegExp(r'[a-z]'));
  final hasDigits = value.contains(RegExp(r'[0-9]'));
  final hasSpecialCharacters = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  if (!hasUppercase || !hasLowercase || !hasDigits || !hasSpecialCharacters) {
    return 'Mật khẩu phải chứa ít nhất một chữ cái hoa, chữ cái thường, số, ký tự đặc biệt';
  }
  return null;
}

// ignore_for_file: must_be_immutable
class SignUpCompleteAccountScreen extends StatelessWidget {
  SignUpCompleteAccountScreen({Key? key}) : super(key: key);

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding: getPadding(top: 47, right: 15),
                                  child: Text("Complete your account",
                                      style: theme.textTheme.headlineSmall))),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: getPadding(top: 9),
                                  child: Text("Lorem ipsum dolor sit amet",
                                      style: CustomTextStyles
                                          .titleSmallBluegray400_1))),
                          Padding(
                              padding: getPadding(top: 33),
                              child: Text("First Name",
                                  style: theme.textTheme.titleSmall)),
                          CustomTextFormField(
                              controller: firstNameController,
                              margin: getMargin(top: 9),
                              hintText: "Enter your first name",
                              hintStyle:
                                  CustomTextStyles.titleMediumBluegray400,
                              contentPadding: getPadding(
                                  left: 12, top: 15, right: 12, bottom: 15)),
                          Padding(
                              padding: getPadding(top: 18),
                              child: Text("Last Name",
                                  style: theme.textTheme.titleSmall)),
                          CustomTextFormField(
                              controller: lastNameController,
                              margin: getMargin(top: 9),
                              hintText: "Enter your last name",
                              hintStyle:
                                  CustomTextStyles.titleMediumBluegray400,
                              contentPadding: getPadding(
                                  left: 12, top: 15, right: 12, bottom: 15)),
                          Padding(
                              padding: getPadding(top: 18),
                              child: Text("Password",
                                  style: theme.textTheme.titleSmall)),
                          CustomTextFormField(
                              validator: (value) {
                                return validatePassword(value ?? '');
                              },
                              controller: passwordController,
                              margin: getMargin(top: 9),
                              hintText: "Create a password",
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
                                        final userData = {
                                          'email': lastNameController.text,
                                          'password': passwordController.text,
                                        };
                                        Provider.of<RegistrationProvider>(
                                                context,
                                                listen: false)
                                            .registerUser(userData, context);
                                      },
                                text: "Continue with Email",
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
                                        Text("Already have an account?",
                                            style: CustomTextStyles
                                                .titleMediumBluegray300),
                                        GestureDetector(
                                            onTap: () {
                                              onTapTxtLargelabelmediu(context);
                                            },
                                            child: Padding(
                                                padding: getPadding(left: 3),
                                                child: Text(" Login",
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
                                                "By signing up you agree to our ",
                                            style: CustomTextStyles
                                                .titleSmallBluegray400SemiBold),
                                        TextSpan(
                                            text: "Terms",
                                            style: CustomTextStyles
                                                .titleSmallErrorContainer),
                                        TextSpan(
                                            text: " and ",
                                            style: CustomTextStyles
                                                .titleSmallBluegray400SemiBold),
                                        TextSpan(
                                            text: "Conditions of Use",
                                            style: CustomTextStyles
                                                .titleSmallErrorContainer)
                                      ]),
                                      textAlign: TextAlign.center)))
                        ])))));
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
