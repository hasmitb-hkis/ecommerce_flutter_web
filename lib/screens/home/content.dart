import 'package:ecommerce_web_flutter/extensions/common_extensions.dart';
import 'package:ecommerce_web_flutter/screens/home/resume.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import '../../navigation/routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/image_path.dart';
import '../../utils/my_font_style.dart';
import '../../widgets/theme_button.dart';
import 'package:pdf/widgets.dart' as pw;

class Content extends StatefulWidget {
  const Content({
    super.key,
  });

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final pdf = pw.Document();

  @override
  Widget build(BuildContext context) {
    final actions = <PdfPreviewAction>[
      // if (!kIsWeb)
      // PdfPreviewAction(
      //   icon: const Icon(Icons.ac_unit),
      //   onPressed: _saveAsFile,
      // )
    ];
    return Stack(
      children: [
        Image.asset(
          ImagePath.landing,
          width: MediaQuery.sizeOf(context).width,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: MediaQuery.sizeOf(context).height * 0.2,
          right: 58,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.33,
            color: AppColors.cream,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Arrival",
                  style: MyFontStyle.semiBold(fontsize: 13),
                ),
                5.height,
                Text(
                  "Discover Our \nNew Collection",
                  style: MyFontStyle.bold(
                      fontsize: 32, color: AppColors.primaryColor),
                ),
                5.height,
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis.",
                  style: MyFontStyle.semiBold(fontsize: 13),
                ),
                40.height,
                ThemeButton(
                  height: 54,
                  width: 200,
                  onClick: () async {
                    Navigator.pushNamed(context, Routes.viewPdf);
                  },
                  radius: 0,
                  text: "BUY NOW",
                  textStyle:
                      MyFontStyle.bold(color: AppColors.white, fontsize: 12),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
