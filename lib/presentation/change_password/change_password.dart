import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image_1.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';
import 'package:nghlong011_s_application5/widgets/custom_text_form_field.dart';

import 'change_pass_provider.dart';

// ignore_for_file: must_be_immutable
class ChangePassScreen extends StatefulWidget {
  ChangePassScreen({Key? key}) : super(key: key);

  @override
  _PersonalInfoScreen createState() => _PersonalInfoScreen();
}

class _PersonalInfoScreen extends State<ChangePassScreen> {
  TextEditingController oldPassController = TextEditingController();

  TextEditingController newPassController = TextEditingController();

  TextEditingController renewPassController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
          backgroundColor: appTheme.whiteA70001,
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
              leadingWidth: getHorizontalSize(48),
              leading: AppbarImage1(
                  svgPath: ImageConstant.imgGroup162799,
                  margin: getMargin(left: 24, top: 13, bottom: 13),
                  onTap: () {
                    onTapArrowbackone(context);
                  }),
              centerTitle: true,
              title: AppbarTitle(text: "Đổi mật khẩu"),
              actions: [
                AppbarImage(
                    svgPath: ImageConstant.imgEditsquare,
                    margin:
                    getMargin(left: 24, top: 13, right: 24, bottom: 13))
              ]),
          body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                  padding: getPadding(top: 32),
                  child: Padding(
                      padding: getPadding(left: 24, right: 24, bottom: 5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Mật khẩu cũ",
                                style: CustomTextStyles.titleSmallPrimary),
                            CustomTextFormField(
                                controller: oldPassController,
                                margin: getMargin(top: 9),
                                hintStyle:
                                CustomTextStyles.titleMediumBluegray400),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text("Mật khẩu mới",
                                    style:
                                    CustomTextStyles.titleSmallPrimary)),
                            CustomTextFormField(
                                controller: newPassController,
                                margin: getMargin(top: 9),
                                hintStyle:
                                CustomTextStyles.titleMediumBluegray400,),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text("Nhập lại mật khẩu mới",
                                    style:
                                    CustomTextStyles.titleSmallPrimary)),
                            CustomTextFormField(
                                controller: renewPassController,
                                margin: getMargin(top: 9),
                                hintStyle:
                                CustomTextStyles.titleMediumBluegray400),
                          ])))),
          bottomNavigationBar: Consumer<ChangePass>(builder: (context, changePass, _) {
            return CustomElevatedButton(
              text: "Sửa",
              margin: getMargin(left: 24, right: 24, bottom: 40),
              buttonStyle: CustomButtonStyles.fillPrimary,
              onTap: changePass.isLoading
                  ? null
                  : () async {
                final String oldPass =
                    oldPassController.text;
                final String newPass =
                    newPassController.text;
                final String renewPass =
                    renewPassController.text;
                if(newPass == renewPass){
                  final userData = {
                    'oldPassword': "pass",
                    'newPassword': "pass",
                  };
                  String? token = await getToken();
                  print(token);
                  await Provider.of<ChangePass>(context, listen: false)
                      .changePasswordUser(userData,context, token!);
                }
                if (changePass.succes) {
                  onTapSavechanges(context);
                }
              },
            );
          }),
        )
    );
  }


  onTapArrowbackone(BuildContext context) {
    Navigator.pop(context);
  }

  onTapSavechanges(BuildContext context) {
    Navigator.pop(context);
  }
}
