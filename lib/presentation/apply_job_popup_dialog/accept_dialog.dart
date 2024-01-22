import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/presentation/home_employer/home_employer.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';

import '../search_screen/SearchProvider.dart';

// ignore_for_file: must_be_immutable
class AcceptPopupDialog extends StatelessWidget {
  final dynamic data;
   AcceptPopupDialog({Key? key, required this.data})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: getHorizontalSize(302),
      height: getHorizontalSize(150),
      padding: getPadding(
        all: 32,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: getHorizontalSize(20),
            child: Text(
              "Bạn chắc chắn muốn xoá không?"
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: CustomElevatedButton(
                onTap: () {
                  Navigator.pop(context);
                },
                height: getVerticalSize(46),
                width: getHorizontalSize(127),
                text: "Huỷ",
                margin: getMargin(
                  top: 20,
                ),
                buttonStyle: CustomButtonStyles.fillPrimaryTL20,
                buttonTextStyle: CustomTextStyles.titleSmallGray5001,
              ),),
              Expanded(
                child: CustomElevatedButton(
                onTap: () async {
                  String? token = await getToken();
                  var dataJobAppProvider = Provider.of<SearchProvider>(context, listen: false);
                  await dataJobAppProvider.dellJob(data, token!, context);
                  if (dataJobAppProvider.succes) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeContainerEmployerScreen(),
                      ),
                    );
                  }

                },
                height: getVerticalSize(46),
                width: getHorizontalSize(127),
                text: "Xác nhận xoá",
                margin: getMargin(
                  left: 10,
                  top: 20,
                ),
                buttonStyle: CustomButtonStyles.fillRedTL4,
                buttonTextStyle: CustomTextStyles.titleSmallGray5001,
              ),)
            ],
          ),
        ],
      ),
    );
  }
}
