import 'package:applicationflutter/models/activity_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripActivityList extends StatelessWidget {
  final List <Activity> activities;
  final Function deleteTripActivity;
  TripActivityList({required this.activities,required this.deleteTripActivity});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemBuilder: (context,index){
            var activity =activities[index];
            return ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage(activity.image),),
              title: Text(activity.name, style: Theme.of(context).textTheme.bodyText1,),
              subtitle: Text(activity.city),
              trailing: IconButton(
                  icon: Icon(
                      Icons.delete,
                      color:Colors.red,
                  ),
                  onPressed: () {
                    deleteTripActivity(activity.id);
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("activité supprimée"),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                    )
                    );
                  },
              ),
            );
          },
        itemCount: activities.length,

      ),
    );
  }
}

