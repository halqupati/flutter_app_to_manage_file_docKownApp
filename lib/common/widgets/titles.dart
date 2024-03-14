
import 'package:flutter/material.dart';
import 'package:getx_app/common/utils/constants.dart';
import 'package:getx_app/common/widgets/appstyle.dart';
import 'package:getx_app/common/widgets/hieght_spacer.dart';
import 'package:getx_app/common/widgets/reusable_text.dart';
import 'package:getx_app/common/widgets/width_spacer.dart';


class BottomTitles extends StatelessWidget {
  const BottomTitles({Key? key, required this.text, required this.text2, this.clr}) : super(key: key);

  final String text;
  final String text2;
  final Color? clr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConst.kWidth,
      child: Padding(padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            Container(
              height: 80,
              width: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(AppConst.kRadius)),
                color: Colors.orange,
              ),
            ),
          const WidthSpacer(wydth: 15),
          Padding(padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableText(text: text, style:
              appstyle(24, AppConst.kLight, FontWeight.bold)),
              HieghtSpacer(hieght: 10),

              ReusableText(text: text2, style:
              appstyle(12, AppConst.kLight, FontWeight.bold)),
            ],
          ),
          ),
        ],
      ),),
    );
  }
}
