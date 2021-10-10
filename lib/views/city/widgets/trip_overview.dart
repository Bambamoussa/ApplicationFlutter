import 'package:applicationflutter/models/trip_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripOverView extends StatelessWidget {
  final VoidCallback setDate;
  final Trip myTrip ;
  final String cityName;
  final double amount;

  TripOverView({
    required this.setDate ,
    required this.myTrip,
    required this.cityName,
    required this.amount
  });

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var size = MediaQuery.of(context).size;
    return  Container(
      height: 150.0,
      width: orientation == Orientation.landscape ? size.width * 0.5 : double.infinity,
      child: Column(children: <Widget>[
        Text(cityName, style: TextStyle(fontSize: 25.0,decoration: TextDecoration.underline),),
        SizedBox(height: 30.0,),
        Row(
          children: [
            Expanded(
                child: Text(DateFormat("d/M/y").format(myTrip.date))),
            RaisedButton(child: Text("choisir la date"),
              onPressed: setDate,
            )
          ],
        ),
        SizedBox(height: 15.0,),
        Text('Montant / personne : $amount \$', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
      ],),
      color: Colors.white,);
  }
}
