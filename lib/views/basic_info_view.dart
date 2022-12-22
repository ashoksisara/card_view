import 'package:card_view_demo/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/text_styles.dart';

class BasicInfoView extends StatelessWidget {
  const BasicInfoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final property = context.watch<HomeProvider>().currentProperty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Basic Info',
          style: AppTextStyles.titleText,
        ),
        const SizedBox(
          height: 10,
        ),
        Table(
          children: [
            tableRowItem('Listing Type', property?.listingType ?? '-'),
            tableRowItem('Property Type', property?.propertyType ?? '-'),
            tableRowItem('Room Type', property?.roomType ?? '-'),
            tableRowItem('Move in date', property?.moveInDate ?? '-'),
            tableRowItem('Length of stay', property?.lengthOfStay ?? '-'),
            tableRowItem('Type', property?.type ?? '-'),
            tableRowItem(
              'For students',
              property?.isSuitableForStudent != null
                  ? property!.isSuitableForStudent == 1
                      ? 'Yes'
                      : 'No'
                  : '-',
            ),
            tableRowItem(
                'Deposit amount', (property?.depositAmount ?? 0).toString()),
          ],
        )
      ],
    );
  }

  TableRow tableRowItem(String title, String subTitle) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            title,
            style: AppTextStyles.bodyLabelText,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(subTitle),
        )
      ],
    );
  }
}
