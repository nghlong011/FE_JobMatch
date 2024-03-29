import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';

// ignore: must_be_immutable
class ChipviewskillsItemWidget extends StatefulWidget {
  var data;
  ChipviewskillsItemWidget({Key? key, required this.data})
      : super(
          key: key,
        );
  @override
  _ChipviewskillsItemWidget createState() => _ChipviewskillsItemWidget();
}

class _ChipviewskillsItemWidget extends State<ChipviewskillsItemWidget> {

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: getPadding(
        left: 16,
        top: 14,
        right: 16,
        bottom: 14,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        widget.data['name']??'',
        style: TextStyle(
          color: theme.colorScheme.primary,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
        ),
      ),
      selected: false,
      backgroundColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
      selectedColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.blueGray50,
          width: getHorizontalSize(1),
        ),
        borderRadius: BorderRadius.circular(
          getHorizontalSize(22),
        ),
      ),
      onSelected: (value) {},
    );
  }
}
