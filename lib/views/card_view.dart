import 'package:flutter/material.dart';

import '../model/property_model.dart';
import '../shared/constant/color_resource.dart';
import '../shared/constant/image_resources.dart';
import '../shared/text_styles.dart';
import '../shared/widgets/image_view.dart';

class CardView extends StatelessWidget {
  final Properties property;

  const CardView({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          property.propertyImages != null
              ? ImageView(
                  imageUrl: property.propertyImages!.first.thumbnail!,
                  fit: BoxFit.cover,
                  height: double.infinity,
                )
              : const SizedBox(),
          Positioned(
            left: 20,
            top: 22,
            child: TitleColumn(title: property.addressArea!,status: property.status!),
          ),
          Positioned(
            right: 4,
            top: 22,
            child: ProfileColumn(
              profileImageUrl: property.user?.profileImage,
            ),
          ),
          Positioned(
            right: 0,
            left: 20,
            bottom: 22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '€${property.personPrice ?? 100}',
                  style: AppTextStyles.titleText.copyWith(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Image.asset(ImageResources.bedroom,height: 18,),
                    const SizedBox(width: 6,),
                    Text('${property.bedrooms ?? 1}',style: AppTextStyles.titleText
                        .copyWith(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 14),),
                    const SizedBox(width: 6,),
                    Image.asset(ImageResources.bathroom,height: 18,),
                    const SizedBox(width: 6,),
                    Text('${property.bathrooms ?? 1}',style:AppTextStyles.titleText
                        .copyWith(color: Colors.white,fontWeight: FontWeight.normal),),
                    const SizedBox(width: 6,),
                    Text('\u2022',style: AppTextStyles.titleText.copyWith(color: Colors.white,fontSize: 16),),
                    const SizedBox(width: 4,),
                    Text(property.nearestLocation ?? '',style: AppTextStyles.titleText
                        .copyWith(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 14),),
                    const SizedBox(width: 6,),
                    Text('\u2022',style: AppTextStyles.titleText.copyWith(color: Colors.white,fontSize: 16,fontWeight: FontWeight.normal),),
                    const SizedBox(width: 4,),
                    Text('${property.nearestLocationTime} walk',style: AppTextStyles.titleText
                        .copyWith(color: Colors.white,fontWeight: FontWeight.normal,fontSize: 14),),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TitleColumn extends StatelessWidget {
  final String title;
  final String status;

  const TitleColumn({Key? key, required this.title, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.titleText.copyWith(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          child: Text(
            status,
            style: AppTextStyles.titleText.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 12),
          ),
        ),
      ],
    );
  }
}

class ProfileColumn extends StatelessWidget {
  final String? profileImageUrl;
  const ProfileColumn({Key? key, required this.profileImageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       ProfileImage(
          url: profileImageUrl,
        ) ,
        const SizedBox(height: 30,),
        SizedBox(
            height: 26,
            child: Image.asset(ImageResources.share)),
        const SizedBox(height: 30,),
        SizedBox(
            height: 26,
            child: Image.asset(ImageResources.playButton))
      ],
    );
  }
}


class ProfileImage extends StatelessWidget {
  final String? url;

  const ProfileImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 22,
            child: ClipOval(
              child: url != null ? ImageView(imageUrl: url!) :
              Image.asset(ImageResources.placeholder,fit: BoxFit.cover,height: 50,),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CircleAvatar(
            backgroundColor: ColorResources.appPinkColor,
            radius: 10,
            child: Image.asset(ImageResources.whatsapp,height: 12),
          ),
        )
      ],
    );
  }
}
