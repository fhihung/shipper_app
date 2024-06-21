import 'package:flutter/material.dart';
import 'package:shipper_app/common/common.dart';

import '../../resources/generated/assets.gen.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return VerticalImageText(
            text: 'Shoes',
            image: Assets.icons.categories.icons8Shoes64.path,
            onTap: () {},
          );
        },
      ),
    );
  }
}
