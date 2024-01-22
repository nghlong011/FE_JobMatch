import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image_1.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';
import 'package:nghlong011_s_application5/widgets/custom_text_form_field.dart';
import 'package:path_provider/path_provider.dart';


import 'create_company_provider.dart';

// ignore_for_file: must_be_immutable
class CreateCompanyScreen extends StatefulWidget {
  CreateCompanyScreen({Key? key}) : super(key: key);

  @override
  _CreateCompanyScreen createState() => _CreateCompanyScreen();
}

class _CreateCompanyScreen extends State<CreateCompanyScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late File _logoImage;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _logoImage = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _logoImage = File("");
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: appTheme.whiteA70001,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
          leadingWidth: getHorizontalSize(48),
          leading: AppbarImage1(
              svgPath: ImageConstant.imgGroup162799,
              margin: getMargin(left: 24, top: 13, bottom: 13),
              onTap: () {
                onTapArrowbackone(context);
              }),
          centerTitle: true,
          title: AppbarTitle(text: "Tạo công ty"),
          actions: []),
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
                        Text("Tên công ty",
                            style: CustomTextStyles.titleSmallPrimary),
                        CustomTextFormField(
                            controller: titleController,
                            margin: getMargin(top: 9),
                            hintText: '',
                            hintStyle: CustomTextStyles.titleMediumBluegray400),
                        Padding(
                            padding: getPadding(top: 18),
                            child: Text("Địa chỉ công ty",
                                style: CustomTextStyles.titleSmallPrimary)),
                        CustomTextFormField(
                            controller: locationController,
                            margin: getMargin(top: 9),
                            hintText: '3 năm',
                            hintStyle: CustomTextStyles.titleMediumBluegray400),
                        Padding(
                            padding: getPadding(top: 18),
                            child: Text("Mô tả công ty",
                                style: CustomTextStyles.titleSmallPrimary)),
                        CustomTextFormField(
                            controller: descriptionController,
                            margin: getMargin(top: 9),
                            hintText: 'thông tin công việc',
                            hintStyle: CustomTextStyles.titleMediumBluegray400,
                            textInputAction: TextInputAction.done,
                            maxLines: 6,
                            contentPadding: getPadding(
                                left: 16, top: 20, right: 16, bottom: 20)),
                        Text("Chọn ảnh logo", style: TextStyle(fontSize: 16)),
                        InkWell(
                          onTap: _pickImage,
                          child: _logoImage.path.isNotEmpty
                              ? Image.file(_logoImage, height: 100, width: 100)
                              : Container(
                                  height: 100,
                                  width: 100,
                                  color: Colors.grey,
                                  child:
                                      Center(child: Icon(Icons.add, size: 40)),
                                ),
                        ),
                      ])))),
      bottomNavigationBar:
          Consumer<CreateCompanyProvider>(builder: (context, createCompanyProvider, _) {
        return CustomElevatedButton(
          text: "Đăng tin",
          margin: getMargin(left: 24, right: 24, bottom: 40),
          buttonStyle: CustomButtonStyles.fillPrimary,
          onTap: createCompanyProvider.isLoading
              ? null
              : () async {
                  final String title = titleController.text;
                  final String location = locationController.text;
                  final String description = descriptionController.text;
                  Directory tempDir = await getTemporaryDirectory();
                  String tempPath = tempDir.path;
                  File htmlFile = createHtmlFile(tempPath, description);
                  FormData userData = FormData.fromMap({
                    'description': await MultipartFile.fromFile(htmlFile.path,
                        filename: 'document.html'),
                    'companyName': title,
                    'location': location,
                    'logo': await MultipartFile.fromFile(_logoImage.path)
                  });
                  String? token = await getToken();
                  await Provider.of<CreateCompanyProvider>(context, listen: false)
                      .createCompany(userData, token!, context);
                  if (createCompanyProvider.succes) {
                    onTapSavechanges(context);
                  }
                },
        );
      }),
    ));
  }

  File createHtmlFile(String tempPath, String text) {
    File file = File('$tempPath/document.html');
    file.writeAsStringSync('<html><body>$text</body></html>');
    return file;
  }

  onTapArrowbackone(BuildContext context) {
    Navigator.pop(context);
  }

  onTapSavechanges(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homePageE);
  }
}
