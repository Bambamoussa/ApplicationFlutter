import 'package:applicationflutter/models/activity_model.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
   final Activity activity;
   final bool isSelected;
   final VoidCallback toggleActivity;

   ActivityCard({required this.activity, required this.isSelected, required this.toggleActivity});

  @override
  Widget build(BuildContext context){
    return  Container(

      height: 150,
      margin: EdgeInsets.all(1.0),
      child:Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Ink.image(
            image: AssetImage(activity.image),
            fit: BoxFit.cover,
            child:InkWell(
                onTap: toggleActivity
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
            Expanded(
                child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                      if(isSelected)
                       Icon(
                          Icons.check,
                          size: 40,
                          color: Colors.white   ,

                     )
                    ],)
              ),
              Row(children: <Widget>[
                Flexible(
                    child: FittedBox(
                           child: Text(
                                      activity.name,
                                      style:TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white
                                      )
                      ),
                    )
                )
              ],)
          ],),)
        ],
      )

    );


  }
}