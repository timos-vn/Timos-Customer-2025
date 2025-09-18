import 'package:flutter/material.dart';

class SelectAirPortPage extends StatefulWidget {

  const SelectAirPortPage({Key? key,}) : super(key: key);
  @override
  _SelectAirPortPageState createState() => _SelectAirPortPageState();
}

class _SelectAirPortPageState extends State<SelectAirPortPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
              height: 470,
              width: double.infinity,
              child: Material(
                  animationDuration: Duration(seconds: 3),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),

                    ],
                  )),
            ),
          ),
        ));
  }
}



