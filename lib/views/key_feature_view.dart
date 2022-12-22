import 'package:card_view_demo/model/property_model.dart';
import 'package:card_view_demo/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/text_styles.dart';
import '../shared/widgets/image_view.dart';

class KeyFeatureView extends StatelessWidget {
  const KeyFeatureView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keyFeatures =
        context.watch<HomeProvider>().currentProperty?.keyFeatures;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Key feature & amenities',
          style: AppTextStyles.titleText,
        ),
        const SizedBox(
          height: 10,
        ),
        keyFeatures != null && keyFeatures.isNotEmpty
            ? SizedBox(
                height: 120,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: keyFeatures.length,
                  itemBuilder: (context, index) {
                    return KeyFeatureItem(keyFeatures: keyFeatures[index]);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                ),
              )
            : const Text(
                'No feature available',
                style: AppTextStyles.bodyText,
              )
      ],
    );
  }
}

class KeyFeatureItem extends StatelessWidget {
  final KeyFeatures keyFeatures;

  const KeyFeatureItem({Key? key, required this.keyFeatures}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.pink, width: 1)),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: 50,
              width: 50,
              child: keyFeatures.colorIconUrl != null
                  ? ImageView(imageUrl: keyFeatures.colorIconUrl!)
                  : const SizedBox()),
          const SizedBox(
            height: 30,
          ),
          Flexible(
              child: Text(
            keyFeatures.name ?? '',
            overflow: TextOverflow.ellipsis,
          ))
        ],
      ),
    );
  }
}
