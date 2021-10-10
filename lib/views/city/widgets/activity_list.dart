import 'package:applicationflutter/datas/data.dart';
import 'package:applicationflutter/models/activity_model.dart';
import 'package:flutter/cupertino.dart';

import 'activity_card.dart';

class ActivityList extends StatelessWidget {
  final List <Activity> activities;
  final List<String> selectedActivities;
  final Function toggleActivity;
  ActivityList({required this.activities,required this.selectedActivities,required this.toggleActivity});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        mainAxisSpacing: 1,
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        children: activities
            .map((activity) => ActivityCard(activity: activity,
                  isSelected:selectedActivities.contains(activity.id),
                  toggleActivity:(){
                    toggleActivity(activity.id);
                  }
        )).toList()
    );
  }
}
