import 'package:nghlong011_s_application5/presentation/add_new_education_screen/add_new_education_screen.dart';
import 'package:nghlong011_s_application5/presentation/new_position_screen/new_position_screen.dart';
import 'package:nghlong011_s_application5/presentation/profile_page/profile_provider.dart';

import '../edit_skill_screen/edit_skill.dart';
import '../profile_page/widgets/chipviewskills_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image_1.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:nghlong011_s_application5/widgets/custom_icon_button.dart';

import '../settings_screen/settings_screen.dart';

// ignore_for_file: must_be_immutable

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool opentowork = false;
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
    var getProfileProvider =
        Provider.of<ProfileProvider>(context, listen: true);
    var data = getProfileProvider.responseData;
    List<String> education =[];
    List<dynamic> languages = [];
    List<dynamic> skill = [];
    List<Map<String, dynamic>> languageObjects = [];
    var dataprofile = data['profileEntity'];
    if(dataprofile != null && dataprofile != []){
      if (data['profileEntity']['education'] != null) {
        education =
            (data['profileEntity']['education'] ?? '').split(',');
      }
      languages = (data['profileEntity']['language'] ?? '').split(',');
      skill = data['profileEntity']['skillEntities'];
      for (int i = 0; i < languages.length; i++) {
        Map<String, dynamic> languageObject = {
          'languageid': i + 1,
          'name': languages[i],
        };
        languageObjects.add(languageObject);
      }
    }

    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            appBar: CustomAppBar(
                leadingWidth: getHorizontalSize(48),
                leading: AppbarImage1(
                    svgPath: ImageConstant.imgGroup162799,
                    margin: getMargin(left: 24, top: 13, bottom: 13),
                    onTap: () {
                      onTapArrowbackone(context);
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "Hồ sơ cá nhân"),
                actions: [
                  AppbarImage(
                      svgPath: ImageConstant.imgGroup162903,
                      margin:
                          getMargin(left: 24, top: 13, right: 24, bottom: 13),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsScreen(),
                          ),
                        );
                      })
                ]),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: getPadding(top: 30),
                    child: Padding(
                        padding: getPadding(bottom: 5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: getVerticalSize(225),
                                  width: getHorizontalSize(327),
                                  child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        CustomImageView(
                                            imagePath: ImageConstant.imgBg,
                                            height: getVerticalSize(120),
                                            width: getHorizontalSize(327),
                                            radius: BorderRadius.circular(
                                                getHorizontalSize(8)),
                                            alignment: Alignment.topCenter),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                                padding: getPadding(
                                                    left: 87, right: 87),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      CustomImageView(
                                                        url: data['avatar'],
                                                          height: getSize(89),
                                                          width: getSize(89),
                                                          radius: BorderRadius
                                                              .circular(
                                                                  getHorizontalSize(
                                                                      44))),
                                                      Padding(
                                                          padding: getPadding(
                                                              top: 9),
                                                          child: Text("Minh",
                                                              style: CustomTextStyles
                                                                  .titleMediumErrorContainer)),
                                                    ])))
                                      ])),
                              Container(
                                  width: getHorizontalSize(272),
                                  margin:
                                      getMargin(left: 52, top: 15, right: 50),
                                  child: Text(
                                      "UI/UX Designer, Web Design, Mobile App Design",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(height: 1.57))),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: getHorizontalSize(300),
                                        padding: getPadding(
                                            left: 40,
                                            top: 12,
                                            right: 40,
                                            bottom: 12),
                                        decoration: AppDecoration.fillGray200
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder24),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Padding(
                                                  padding: getPadding(top: 2),
                                                  child: Text("25",
                                                      style: CustomTextStyles
                                                          .titleMediumBold_1)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 8, top: 5),
                                                  child: Text(
                                                      "Công việc đã ứng tuyển",
                                                      style: theme.textTheme
                                                          .labelLarge))
                                            ])),
                                  ]),
                              Padding(
                                  padding: getPadding(top: 24),
                                  child: Divider(color: appTheme.indigo50)),
                              Container(
                                  margin:
                                      getMargin(left: 24, top: 22, right: 24),
                                  padding: getPadding(
                                      left: 16, top: 14, right: 16, bottom: 14),
                                  decoration: AppDecoration.outlineIndigo
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder12),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      top: 2, bottom: 1),
                                                  child: Text("Giới thiệu",
                                                      style: CustomTextStyles
                                                          .titleMediumInter)),
                                              CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgEditsquare,
                                                  height: getSize(24),
                                                  width: getSize(24))
                                            ]),
                                        Container(
                                            width: getHorizontalSize(272),
                                            margin:
                                                getMargin(top: 14, right: 22),
                                            child: Text(
                                                data['profileEntity']
                                                    ['description'],
                                                maxLines: 5,
                                                overflow: TextOverflow.ellipsis,
                                                style: CustomTextStyles
                                                    .titleSmallBluegray400_1
                                                    .copyWith(height: 1.57)))
                                      ])),
                              Container(
                                  margin:
                                      getMargin(left: 23, top: 24, right: 23),
                                  padding: getPadding(
                                      left: 9, top: 16, right: 9, bottom: 16),
                                  decoration: AppDecoration.outlineIndigo
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder12),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding:
                                                getPadding(left: 7, right: 7),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          top: 1, bottom: 2),
                                                      child: Text("Kĩ năng",
                                                          style: CustomTextStyles
                                                              .titleMediumInter)),
                                                  CustomImageView(
                                                      onTap: () {
                                                        Navigator
                                                            .push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                EditSkillScreen(),
                                                          ),
                                                        );
                                                      },
                                                      svgPath: ImageConstant
                                                          .imgEditsquare,
                                                      height: getSize(24),
                                                      width: getSize(24))
                                                ])),
                                        Padding(
                                            padding:
                                                getPadding(top: 12, bottom: 17),
                                            child: Wrap(
                                                runSpacing: getVerticalSize(12),
                                                spacing: getHorizontalSize(12),
                                                children: List<Widget>.generate(
                                                    skill.length,
                                                    (index) =>
                                                        ChipviewskillsItemWidget(
                                                            data:
                                                                skill[index]))))
                                      ])),
                              Container(
                                  margin:
                                  getMargin(left: 23, top: 24, right: 23),
                                  padding: getPadding(
                                      left: 9, top: 16, right: 9, bottom: 16),
                                  decoration: AppDecoration.outlineIndigo
                                      .copyWith(
                                      borderRadius:
                                      BorderRadiusStyle.circleBorder12),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding:
                                            getPadding(left: 7, right: 7),
                                            child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          top: 1, bottom: 2),
                                                      child: Text("Ngôn ngữ",
                                                          style: CustomTextStyles
                                                              .titleMediumInter)),
                                                  CustomImageView(
                                                      onTap: () {
                                                        Navigator
                                                            .push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                EditSkillScreen(),
                                                          ),
                                                        );
                                                      },
                                                      svgPath: ImageConstant
                                                          .imgEditsquare,
                                                      height: getSize(24),
                                                      width: getSize(24))
                                                ])),
                                        Padding(
                                            padding:
                                            getPadding(top: 12, bottom: 17),
                                            child: Wrap(
                                                runSpacing: getVerticalSize(12),
                                                spacing: getHorizontalSize(12),
                                                children: List<Widget>.generate(
                                                    languageObjects.length,
                                                        (index) =>
                                                        ChipviewskillsItemWidget(
                                                            data:
                                                            languageObjects[index]))))
                                      ])),
                              Container(
                                  margin:
                                      getMargin(left: 24, top: 22, right: 24),
                                  padding: getPadding(
                                      left: 16, top: 14, right: 16, bottom: 14),
                                  decoration: AppDecoration.outlineIndigo
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder12),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding: getPadding(
                                                      top: 2, bottom: 1),
                                                  child: Text(
                                                      "Kinh nghiệm làm việc",
                                                      style: CustomTextStyles
                                                          .titleMediumInter)),
                                              CustomImageView(
                                                  onTap: () {
                                                    Navigator
                                                        .push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            NewPositionScreen(),
                                                      ),
                                                    );
                                                  },
                                                  svgPath: ImageConstant
                                                      .imgEditsquare,
                                                  height: getSize(24),
                                                  width: getSize(24))
                                            ]),
                                        Container(
                                            width: getHorizontalSize(272),
                                            margin:
                                                getMargin(top: 14, right: 22),
                                            child: Text(
                                                data['profileEntity']
                                                    ['workExperience'],
                                                maxLines: 5,
                                                overflow: TextOverflow.ellipsis,
                                                style: CustomTextStyles
                                                    .titleSmallBluegray400_1
                                                    .copyWith(height: 1.57)))
                                      ])),
                              Container(
                                  margin:
                                      getMargin(left: 24, top: 24, right: 24),
                                  padding: getPadding(all: 16),
                                  decoration: AppDecoration.outlineBluegray50
                                      .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.circleBorder12),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                  padding: getPadding(top: 2),
                                                  child: Text(
                                                      "Trình độ giáo dục",
                                                      style: CustomTextStyles
                                                          .titleMediumBold_1)),
                                              CustomImageView(
                                                  onTap: () {
                                                    Navigator
                                                        .push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            AddNewEducationScreen(),
                                                      ),
                                                    );
                                                  },
                                                  svgPath: ImageConstant
                                                      .imgEditsquarePrimary,
                                                  height: getSize(24),
                                                  width: getSize(24))
                                            ]),
                                        Padding(
                                            padding:
                                                getPadding(top: 24, right: 83),
                                            child: Row(children: [
                                              CustomIconButton(
                                                  height: getSize(48),
                                                  width: getSize(48),
                                                  padding: getPadding(all: 8),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgFrame162724)),
                                              Expanded(
                                                  child: Padding(
                                                      padding: getPadding(
                                                          left: 10, top: 5),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(education[0],
                                                                style: CustomTextStyles
                                                                    .titleSmallPrimarySemiBold),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 6),
                                                                child: Row(
                                                                    children: [
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              top:
                                                                                  1),
                                                                          child: Text(
                                                                              education[1],
                                                                              style: theme.textTheme.labelLarge)),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              left:
                                                                                  4,
                                                                              top:
                                                                                  1),
                                                                          child: Text(
                                                                              "•",
                                                                              style: theme.textTheme.labelLarge)),
                                                                      Padding(
                                                                          padding: getPadding(
                                                                              left:
                                                                                  4),
                                                                          child: Text(
                                                                              education[2],
                                                                              style: theme.textTheme.labelLarge))
                                                                    ]))
                                                          ])))
                                            ]))
                                      ]))
                            ]))))));
  }

  onTapArrowbackone(BuildContext context) {
    Navigator.pop(context);
  }
}
