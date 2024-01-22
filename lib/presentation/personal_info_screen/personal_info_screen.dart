import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image_1.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';
import 'package:nghlong011_s_application5/widgets/custom_text_form_field.dart';

import '../../data/repository/update_profile.dart';
import '../profile_page/profile_provider.dart';

// ignore_for_file: must_be_immutable
class PersonalInfoScreen extends StatefulWidget {
  PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  _PersonalInfoScreen createState() => _PersonalInfoScreen();
}

class _PersonalInfoScreen extends State<PersonalInfoScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController dobController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String? token = await getToken();
      final userData = {
        'email': 'admin',
      };
      var dataJobProvider =
          Provider.of<ProfileProvider>(context, listen: false);
      dataJobProvider.getProfile(userData, token!);
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    var getProfileProvider = Provider.of<ProfileProvider>(context, listen: true);
    var data = getProfileProvider.responseData;
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
                title: AppbarTitle(text: "Sửa thông tin cá nhân"),
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
                              Text("Họ và tên",
                                  style: CustomTextStyles.titleSmallPrimary),
                              CustomTextFormField(
                                  controller: nameController,
                                  margin: getMargin(top: 9),
                                  hintText: data['name']??'',
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray400),
                              Padding(
                                  padding: getPadding(top: 18),
                                  child: Text("Ngày sinh",
                                      style:
                                          CustomTextStyles.titleSmallPrimary)),
                              CustomTextFormField(
                                  controller: dobController,
                                  margin: getMargin(top: 9),
                                  hintText: data['dob']??'',
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray400,
                                  textInputType: TextInputType.emailAddress),
                              Padding(
                                  padding: getPadding(top: 18),
                                  child: Text("Số điện thoại",
                                      style:
                                          CustomTextStyles.titleSmallPrimary)),
                              CustomTextFormField(
                                  controller: phoneController,
                                  margin: getMargin(top: 9),
                                  hintText: data['phone']??'',
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray400),
                              Padding(
                                  padding: getPadding(top: 18),
                                  child: Text("Địa chỉ",
                                      style:
                                          CustomTextStyles.titleSmallPrimary)),
                              CustomTextFormField(
                                  controller: locationController,
                                  margin: getMargin(top: 9),
                                  hintText: data['address']??'',
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray400,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 6,
                                  contentPadding: getPadding(
                                      left: 16, top: 20, right: 16, bottom: 20))
                            ])))),
            bottomNavigationBar: Consumer<UpdateProfile>(builder: (context, updateProfile, _) {
              return CustomElevatedButton(
                text: "Sửa",
                margin: getMargin(left: 24, right: 24, bottom: 40),
                buttonStyle: CustomButtonStyles.fillPrimary,
                onTap: updateProfile.isLoading
                    ? null
                    : () async {
                  final String name =
                      nameController.text;
                  final String dob =
                      dobController.text;
                  final String phone =
                      phoneController.text;
                  final String location =
                      locationController.text;
                  FormData userData = FormData.fromMap({
                    'name': name,
                    'phone': phone,
                    'address': location,
                    'dob': dob
                  });
                  String? token = await getToken();
                  await Provider.of<UpdateProfile>(context, listen: false)
                      .updateProfile(userData, token!, context);
                  if (updateProfile.succes) {
                    onTapSavechanges(context);
                  }
                },
              );
            }),
        )
    );
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowbackone(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapSavechanges(BuildContext context) {
    Navigator.pop(context);
  }
}
