import 'package:ecommerce_web_flutter/extensions/common_extensions.dart';
import 'package:flutter/material.dart';
import '../../utils/my_font_style.dart';
import 'browse_model.dart';

class BrowseProduct extends StatelessWidget {
  const BrowseProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Browse The Range",
          style: MyFontStyle.bold(fontsize: 32),
        ),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
          style: MyFontStyle.semiBold(fontsize: 20),
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: browseList.length,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.1, vertical: 50),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 0.95),
          itemBuilder: (context, index) => Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(browseList[index].image),
                          fit: BoxFit.fill)),
                ),
              ),
              25.height,
              Text(
                browseList[index].name,
                style: MyFontStyle.semiBold(fontsize: 24),
              )
            ],
          ),
        )
      ],
    );
  }
}
