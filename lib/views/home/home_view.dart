import 'package:applicationflutter/models/city_model.dart';
import 'package:applicationflutter/views/home/widgets/city_card_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
    @override
    _HomeState createState(){
      return _HomeState();
    }
}
class _HomeState extends State<HomeView> {
  List cities = [
      City_view(name: "Abidjan", image: 'assets/images/baselique1.jpg') ,
      City_view(name: 'Yakro', image: 'assets/images/baselique2.jpg') ,
      City_view(name: 'San pedro', image:'assets/images/baselique.jpg')
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('dymatrip'),
        actions: <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...cities.map((city)  {
             return  CityCard( city:city);

            })

          ],
        ),
      ),
    );
  }
}
