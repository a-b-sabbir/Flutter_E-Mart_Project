import 'package:emart_app/consts/consts.dart';

Widget featuredButtons({
  String? title,
  icons,
  onPress,
}) {
  return Row(
    children: [
      Image.asset(
        icons,
        width: 60,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      title!.text.make()
    ],
  )
      .box
      .white
      .width(200)
      .roundedSM
      .outerShadowSm
      .padding(EdgeInsets.all(4))
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .make();
}
