import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';
import 'package:nghlong011_s_application5/widgets/custom_text_form_field.dart';

import 'Regis.dart';

// ignore_for_file: must_be_immutable
class SignUpCompleteAccountScreen extends StatefulWidget {
  SignUpCompleteAccountScreen({Key? key}) : super(key: key);

  @override
  State<SignUpCompleteAccountScreen> createState() => _SignUpCompleteAccountScreenState();
}

class _SignUpCompleteAccountScreenState extends State<SignUpCompleteAccountScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController rePasswordController = TextEditingController();

  TextEditingController addController = TextEditingController();

  Future<void> registerUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      print('User registered: ${userCredential.user?.email}');
    } catch (e) {
      print('Error during registration: $e');
    }
  }
  bool isPasswordError = true;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedGender;
  String selectedDate = '';
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    int? receivedOption = ModalRoute.of(context)!.settings.arguments as int?;
    String? role;
    if (receivedOption ==1){
      role = "ROLE_JOB_SEEKER";
    }else{
      role = "ROLE_EMPLOYER";
    }
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            resizeToAvoidBottomInset: true,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 24, top: 13, right: 24, bottom: 13),
                    child: SingleChildScrollView(
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
                                padding: getPadding(top: 33),
                                child: Text("Số điện thoại",
                                    style: theme.textTheme.titleSmall)),
                            CustomTextFormField(
                                controller: phoneController,
                                margin: getMargin(top: 9),
                                hintText: "Nhập số điện thoại",
                                hintStyle:
                                    CustomTextStyles.titleMediumBluegray400,
                                contentPadding: getPadding(
                                    left: 12, top: 15, right: 12, bottom: 15)),
                            Text(
                              'Ngày sinh',
                              style: TextStyle(fontSize: 16),
                            ),
                            DateTimePicker(
                              type: DateTimePickerType.date,

                              dateMask: 'dd/MM/yyyy',
                              initialValue: DateTime.now().toString(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                              icon: Icon(Icons.event),
                              dateLabelText: 'Date',
                              onChanged: (val) {
                                setState(() {
                                  selectedDate = val;
                                });
                              },
                              validator: (val) {

                                return null;
                              },
                              onSaved: (val) {

                              },

                            ),
                            Padding(
                              padding: getPadding(top: 18),
                              child: Text(
                                "Giới tính",
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                            Row(
                              children: [
                                Radio<String>(
                                  value: "Nam",
                                  groupValue: selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value;
                                    });
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                        (Set<MaterialState> states) {
                                      // Đặt màu của radio button khi ở trạng thái bình thường
                                      if (states.contains(MaterialState.selected)) {
                                        return Colors.blue; // Màu của radio button khi được chọn
                                      }
                                      return Colors.blue; // Màu của radio button khi ở trạng thái bình thường
                                    },
                                  ),
                                ),
                                Text("Nam"),
                                SizedBox(
                                  width: getVerticalSize(20),
                                ),
                                Radio<String>(
                                  value: "Nữ",
                                  groupValue: selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value;
                                    });
                                  },
                                  fillColor: MaterialStateColor.resolveWith(
                                        (Set<MaterialState> states) {
                                      // Đặt màu của radio button khi ở trạng thái bình thường
                                      if (states.contains(MaterialState.selected)) {
                                        return Colors.blue; // Màu của radio button khi được chọn
                                      }
                                      return Colors.blue; // Màu của radio button khi ở trạng thái bình thường
                                    },
                                  ),
                                ),
                                Text("Nữ"),
                                // Thêm các radio button khác tùy thuộc vào nhu cầu của bạn
                              ],
                            ),
                            Padding(
                                padding: getPadding(top: 33),
                                child: Text("Địa chỉ",
                                    style: theme.textTheme.titleSmall)),
                            CustomTextFormField(
                                controller: addController,
                                margin: getMargin(top: 9),
                                hintText: "Nhập địa chỉ",
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
                                child: Text("Mật khẩu",
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
                                        left: 30,
                                        top: 14,
                                        right: 16,
                                        bottom: 14),
                                    child: CustomImageView(
                                      onTap: (){
                                        setState(() {
                                          isPasswordError = !isPasswordError;
                                        });
                                      },
                                        svgPath: ImageConstant.imgCheckmark)),
                                suffixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(52)),
                                obscureText: isPasswordError,
                                contentPadding:
                                    getPadding(left: 16, top: 15, bottom: 15)),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text("Nhập lại mật khẩu",
                                    style: theme.textTheme.titleSmall)),
                            CustomTextFormField(
                                controller: rePasswordController,
                                margin: getMargin(top: 9),
                                hintText: "Nhập mật khẩu",
                                hintStyle:
                                    CustomTextStyles.titleMediumBluegray400,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.visiblePassword,
                                suffix: Container(
                                    margin: getMargin(
                                        left: 30,
                                        top: 14,
                                        right: 16,
                                        bottom: 14),
                                    child: CustomImageView(
                                        onTap: (){
                                          setState(() {
                                            isPasswordError = !isPasswordError;
                                          });
                                        },
                                        svgPath: ImageConstant.imgCheckmark)),
                                suffixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(52)),
                                obscureText: isPasswordError,
                                contentPadding:
                                    getPadding(left: 16, top: 15, bottom: 15)),
                            Consumer<RegistrationProvider>(
                                builder: (context, registrationProvider, _) {
                              return CustomElevatedButton(
                                  onTap:
                                  registrationProvider.isLoading
                                      ? null
                                      : () async {
                                          final String email =
                                              emailController.text;
                                          final String password =
                                              passwordController.text;
                                          final String rePassword =
                                              rePasswordController.text;
                                          final String add =
                                              addController.text;
                                          final String name =
                                              nameController.text;
                                          final String phone =
                                              phoneController.text;
                                          int? gender;
                                          if(selectedGender =='Nam'){
                                            gender= 1;
                                          }else{
                                            gender= 2;
                                          }
                                          if(email.isNotEmpty && password.isNotEmpty && rePassword.isNotEmpty && add.isNotEmpty && name.isNotEmpty
                                              && phone.isNotEmpty && selectedDate != '' && selectedGender != null  )
                                          {
                                            if(isEmailValid(email)){
                                              if (password.isNotEmpty && isValidPassword(password)) {
                                                if(password == rePassword){
                                                  final userData = {
                                                    'email': email,
                                                    'password': password,
                                                    'role': role,
                                                    'name': name,
                                                    'dob':selectedDate,
                                                    'address': add,
                                                    'phone':phone,
                                                    'gender':gender,
                                                  };
                                                  final loginData = {
                                                    'email': email,
                                                    'password': password,
                                                  };
                                                   var data= await Provider.of<RegistrationProvider>(
                                                      context,
                                                      listen: false)
                                                      .registerUser(userData, context,receivedOption!);
                                                  if(data == 'Đăng kí thành công')
                                                  {
                                                    await registerUser();
                                                    if(receivedOption == 1){
                                                      Navigator.pushNamed(context, AppRoutes.loginScreen);
                                                    }else{

                                                    }
                                                  }
                                                  Provider.of<RegistrationProvider>(
                                                      context,
                                                      listen: false)
                                                      .loginUser(loginData, context,receivedOption);

                                                }else{

                                                }
                                              }
                                              else {
                                                showDialog(context: context,
                                                    builder: (BuildContext context) {
                                                      return AlertDialog(
                                                        backgroundColor: Colors.white,
                                                        content: Text('Mật khẩu phải có ít nhất 8 ký tự, chứa 1 chữ hoa, \n'
                                                            '1 chữ thường, 1 chữ số, 1 ký tự đặc biệt và không chứa khoảng trắng'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.of(context).pop();
                                                            },
                                                            child: Text('Đóng'),
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              }
                                            }
                                            else{
                                              showDialog(context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      backgroundColor: Colors.white,
                                                      content: Text('Email sai định dạng'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(context).pop();
                                                          },
                                                          child: Text('Đóng'),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            }
                                          }
                                          else{
                                            showDialog(context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor: Colors.white,
                                                    content: Text('Vui lòng điền đầy đủ thông tin'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text('Đóng'),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          }
                                        },
                                  text: "Đăng Ký",
                                  margin: getMargin(top: 40),
                                  buttonStyle: CustomButtonStyles.fillPrimary);
                            }),
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: getPadding(
                                        left: 40, top: 28, right: 40),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Bạn đã có tài khoản?",
                                              style: CustomTextStyles
                                                  .titleMediumBluegray300),
                                          GestureDetector(
                                              onTap: () {
                                                onTapTxtLargelabelmediu(
                                                    context);
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
                                        left: 40,
                                        top: 19,
                                        right: 40,
                                        bottom: 5),
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
                          ]),
                    )))));
  }

  onTapImgImage(BuildContext context) {
    Navigator.pop(context);
  }

  onTapTxtLargelabelmediu(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }

}