import 'package:flutter/material.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../helper/app_helper.dart';
import '../model/property_model.dart';

class HomeProvider extends ChangeNotifier {
  Properties? currentProperty;
  bool isLoading = false;
  List<Properties> propertyList = [];
  final List<SwipeItem> swipeItems = <SwipeItem>[];
  MatchEngine? matchEngine;
  bool isCardFinished = false;

  //get json data from asset txt file
  Future<void> getJsonData() async {
    isLoading = true;
    PropertyModel? propertyModel = await AppHelper.readJson();
    if (propertyModel != null) {
      propertyList = propertyModel.data?.properties ?? [];
      for (int i = 0; i < propertyList.length; i++) {
        swipeItems.add(
          SwipeItem(
            content: propertyList[i],
            likeAction: () {
              notifyListeners();
            },
            nopeAction: () {
              notifyListeners();
            },
            onSlideUpdate: (SlideRegion? region) async {
            },
          ),
        );
      }
      matchEngine = MatchEngine(swipeItems: swipeItems);
      if(propertyList.isNotEmpty){
        currentProperty = propertyList.first;
      }
    }
    isLoading = false;
    notifyListeners();
  }

  //Update current property
  void updateProperty(Properties property){
    currentProperty = property;
    notifyListeners();
  }

  //Update bool if cards are finished
  void onCardFinished(){
    isCardFinished = true;
    notifyListeners();
  }

}
