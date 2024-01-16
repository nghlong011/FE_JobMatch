import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image_1.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';
import 'package:nghlong011_s_application5/widgets/custom_text_form_field.dart';

import 'edit_skill_provider.dart';

// ignore_for_file: must_be_immutable
class EditSkillScreen extends StatefulWidget {
  EditSkillScreen({Key? key}) : super(key: key);

  @override
  _EditSkillScreen createState() => _EditSkillScreen();
}
class _EditSkillScreen extends State<EditSkillScreen> {

  TextEditingController skillNameController = TextEditingController();

  TextEditingController skillExpController = TextEditingController();


  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                title: AppbarTitle(text: "Thêm Kĩ năng"),
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
                              Text("Tên kĩ năng",
                                  style: CustomTextStyles.titleSmallPrimary),
                              CustomTextFormField(
                                  controller: skillNameController,
                                  margin: getMargin(top: 9),
                                  hintText: "Java,Python...",
                                  hintStyle:
                                  CustomTextStyles.titleMediumBluegray400),
                              Padding(
                                  padding: getPadding(top: 18),
                                  child: Text("Năm kinh nghiệm",
                                      style:
                                      CustomTextStyles.titleSmallPrimary)),
                              CustomTextFormField(
                                  controller: skillExpController,
                                  margin: getMargin(top: 9),
                                  hintText: "3 năm kinh nghiệm",
                                  hintStyle:
                                  CustomTextStyles.titleMediumBluegray400),
                            ]
                        )
                    )
                )
            ),
            bottomNavigationBar: Consumer<EditSkillProvider>(
                builder: (context, editSkillProvider, _) {
                  return CustomElevatedButton(
                      onTap: editSkillProvider.isLoading
                      ? null
                      : () async {
                    final String name =
                        skillNameController.text;
                    final String exp =
                        skillExpController.text;
                    String? token = await getToken();
                    final userData = {
                      'name': name,
                      'exp': exp,
                    };
                    if(name.isNotEmpty && exp.isNotEmpty) {
                      Provider.of<EditSkillProvider>(
                          context,
                          listen: false)
                          .addSkill(userData, token!, context);
                      print(editSkillProvider.succes);
                      if (editSkillProvider.succes) {
                        Navigator.pop(context);
                      }
                    }
                  },
                  text: "Thêm kĩ năng",
                  margin: getMargin(left: 24, right: 24, bottom: 44),
                  buttonStyle: CustomButtonStyles.fillPrimary);
                  }
                  ),
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
