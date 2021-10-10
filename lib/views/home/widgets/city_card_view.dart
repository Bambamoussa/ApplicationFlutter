import 'dart:developer';
import 'package:applicationflutter/models/city_model.dart';
import 'package:applicationflutter/views/city/city_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final City_view city;
  CityCard({required this.city});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child:  Container(
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Ink.image(
              fit: BoxFit.cover,
              image: AssetImage(city.image),
              child: InkWell(
              onTap: (){
                Navigator.pushNamed(
                  context,
                   '/city',
                  arguments: City_view(name: city.name, image: city.image),
                );
              },
            ),
            ),
          Positioned(
              top: 10,
              left: 10,
              child: Container(
               padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
               color: Colors.black54,
               child: Text(city.name,
                  style: TextStyle(fontSize: 35,color: Colors.white,),
                ),
              )
          )
          ],
        ),
      ),
    );
  }
}
