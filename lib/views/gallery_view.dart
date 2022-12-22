import 'package:card_view_demo/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../shared/text_styles.dart';
import '../shared/widgets/image_view.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final images = context.watch<HomeProvider>().currentProperty?.propertyImages;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gallery',
          style: AppTextStyles.titleText,
        ),
        const SizedBox(
          height: 10,
        ),
        images != null && images.isNotEmpty
            ? SizedBox(
                height: 210,
                child: CarouselSlider.builder(
                    unlimitedMode: false,
                    slideBuilder: (index) {
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: ImageView(imageUrl: images[index].thumbnail!,
                              fit: BoxFit.cover, width: double.infinity));
                    },
                    slideTransform: const DefaultTransform(),
                    slideIndicator: CircularSlideIndicator(
                      indicatorRadius: 5,
                      indicatorBackgroundColor: Colors.grey,
                      currentIndicatorColor: Colors.white,
                      padding: const EdgeInsets.only(bottom: 32),
                    ),
                    itemCount: images.length),
              )
            : const Text('No images available')
      ],
    );
  }
}
