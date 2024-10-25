import 'package:awrad/core/custom_widgets/custom_initial_widget.dart';
import 'package:flutter/material.dart';


class MorningDhikrsView extends StatelessWidget {
  static const String routeNamed = 'MorningDhikrsView';
  const MorningDhikrsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: CustomInitialWidget(),
/*      ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index){
          return CategoryDetailsItem(categoryAzkarModel: CategoryAzkarModel(id: 1, categoryId: 5,title: 'title',content: 'content',isFav: true), index: 1, clr: Colors.purple,);
        },
         ),*/
      //CategoryDetailsListView(clr: Color(0xffE09326)),
    );
  }
}
