import 'package:card_view_demo/views/card_view.dart';
import 'package:card_view_demo/views/gallery_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../providers/home_provider.dart';
import 'basic_info_view.dart';
import 'description_view.dart';
import 'key_feature_view.dart';
import 'location_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    //get json data from asset txt file
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.getJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
        if(homeProvider.isLoading){
          return const Center(child: CircularProgressIndicator(),);
        }
        return Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: !homeProvider.isCardFinished ? ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                homeProvider.matchEngine != null
                    ? SizedBox(
                        height:
                            MediaQuery.of(context).size.height - kToolbarHeight,
                        child: SwipeCards(
                          matchEngine: homeProvider.matchEngine!,
                          itemBuilder: (BuildContext context, int index) {
                            return CardView(
                              property: homeProvider.swipeItems[index].content,
                            );
                          },
                          onStackFinished: () {
                            homeProvider.onCardFinished();
                          },
                          itemChanged: (SwipeItem item, int index) {
                            debugPrint("index: $index");
                            homeProvider.updateProperty(item.content);
                          },
                          upSwipeAllowed: false,
                          fillSpace: true,
                        ),
                      )
                    : SizedBox(
                        height:
                            MediaQuery.of(context).size.height - kToolbarHeight,
                      ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      DescriptionView(),
                      SizedBox(
                        height: 20,
                      ),
                      LocationView(),
                      SizedBox(
                        height: 20,
                      ),
                      KeyFeatureView(),
                      SizedBox(
                        height: 20,
                      ),
                      GalleryView(),
                      SizedBox(
                        height: 20,
                      ),
                      BasicInfoView(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ) : const Center(child: Text('No property available'),),
        );
      }),
    );
  }
}
