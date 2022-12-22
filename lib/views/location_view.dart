import 'package:card_view_demo/shared/widgets/map_view.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/home_provider.dart';
import '../shared/text_styles.dart';

class LocationView extends StatelessWidget {
  const LocationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final property = context.watch<HomeProvider>().currentProperty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Location',
          style: AppTextStyles.titleText,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${property?.addressStreetName} ${property?.addressCity}',
          style: AppTextStyles.bodyText,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: MapView(
              initialLatLng: LatLng(
                double.tryParse((property?.latitude ?? 0).toString()) ?? 0,
                double.tryParse((property?.longitude ?? 0).toString()) ?? 0,
              ),
              isFromFullScreen: false,
            ),
          ),
        )
      ],
    );
  }
}
