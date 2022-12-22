import 'package:card_view_demo/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/text_styles.dart';

class DescriptionView extends StatelessWidget {
  const DescriptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: AppTextStyles.titleText,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          homeProvider.currentProperty?.description ?? '',
          style: AppTextStyles.bodyText,
        ),
      ],
    );
  }
}
