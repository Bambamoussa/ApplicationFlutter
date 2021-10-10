import 'package:applicationflutter/models/activity_model.dart';
import 'package:applicationflutter/models/city_model.dart';
import 'package:applicationflutter/models/trip_model.dart';
import 'package:applicationflutter/views/city/widgets/activity_list.dart';
import 'package:applicationflutter/views/city/widgets/trip_activity_list.dart';
import 'package:applicationflutter/views/city/widgets/trip_overview.dart';
import 'package:applicationflutter/datas/data.dart' as data;
import 'package:applicationflutter/views/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class CityView extends StatefulWidget {

 final List<Activity> activities = data.activities;
  showContext({required BuildContext context, required List<Widget> children}){
    var orientation = MediaQuery.of(context).orientation;
    if(orientation == Orientation.landscape){
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    }
    else{
      return Column(children: children);
    }
  }

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<CityView>  with WidgetsBindingObserver{
   late Trip myTrip ;
   late int index ;
   late List<Activity> activities ;
   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    myTrip = Trip(city:"Abidjan", activities:[], date: DateTime.now());
    index = 0;
  }
  /*@override
  didChangeDependencies(){
     super.didChangeDependencies();
     activities = Data.of(context);
  }*/

  /*@override
  didChangeAppLifecycleState(AppLifecycleState state){
     super.didChangeAppLifecycleState(state);
     print(state);
  }*/
  @override
  void dispose(){
     super.dispose();
     WidgetsBinding.instance!.removeObserver(this);
  }

  List<Activity> get tripActivities {
     return widget.activities.where((activity) => myTrip.activities.contains(activity.id)).toList();
  }
  double get amount{
    return myTrip.activities.fold(0.0, (previousValue, element) {
      var activity = widget.activities.firstWhere((activity) => activity.id == element
      );
    return previousValue + activity.price ;
    });
  }
   void setDate(){
     showDatePicker(
        context: context,
        initialDate:DateTime.now().add(Duration(days: 1)) ,
        firstDate:DateTime.now() ,
        lastDate: DateTime(2022),

     ).then((newDate){
       if(newDate !=null){
          setState(() {
            myTrip.date=newDate;
          });
       }

     });
   }
   void switchIndex(newIndex){
     setState(() {
       index = newIndex;
     });
   }

   void toggleActivity(String id){
     setState(() {
       myTrip.activities.contains(id) ? myTrip.activities.remove(id):myTrip.activities.add(id);
     });

   }

   void deleteTripActivity(String id){
     setState(() {
       myTrip.activities.remove(id);
     });
   }

   void saveTrip() async{
    final result = await showDialog(context: context, builder: (context){
       return SimpleDialog(
            title: Text('Voulez vous sauvegarder ?'),
            contentPadding: EdgeInsets.all(20.0),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                      child: Text('Annuler'),
                      onPressed:(){
                        Navigator.pop(context,"annuler");
                      }
                      ),
                  SizedBox(width: 20.0),
                  RaisedButton(
                      child: Text('Sauvergarder',
                            style: TextStyle(color: Colors.white),
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: (){
                        Navigator.pop(context,"save");
                      }
                      )
                ],
              )
            ],
       );
     },
     );
    Navigator.pop(context, HomeView);
   }

  @override
  Widget build(BuildContext context) {
    final  city = ModalRoute.of(context)!.settings.arguments as City_view;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.chevron_left),
        title: Text('Organisation de voyage'),
        actions: <Widget>[
          Icon(Icons.more_vert),
        ],
      ),
      body: Container(

        padding: EdgeInsets.all(10),
        child:widget.showContext(
            context: context,
            children: <Widget>[
               TripOverView(
                   cityName: city.name,
                   setDate: setDate,
                   myTrip: myTrip,
                   amount: amount,
               ),
               Expanded(
                  child: index == 0 ? ActivityList(activities:widget.activities, selectedActivities:myTrip.activities,toggleActivity:toggleActivity,): TripActivityList(activities :tripActivities,deleteTripActivity:deleteTripActivity),

            )
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveTrip,
        child: Icon(Icons.forward),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Decouverte'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.stars),
          title: Text('Mes activites'),

        )
      ],
      onTap:switchIndex,
      ),
    );
  }
}
