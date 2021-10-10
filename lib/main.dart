import 'package:applicationflutter/views/city/city_view.dart';
import 'package:applicationflutter/views/home/home_view.dart';
import 'package:applicationflutter/views/home/widgets/404/not_found.dart';
import 'package:applicationflutter/widgets/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 30.0),
          ),
          primarySwatch: Colors.green,
          textTheme: TextTheme(bodyText1: TextStyle(color:Colors.green))
      ),
      debugShowCheckedModeBanner : false,
      home:HomeView(),
      routes: {
        '/city': (context){
          return CityView();

        }
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (context)=> NotFound());
      },
      //home: Data(child: CityView())
    );
  }
}
