import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nursurey/plantdetail.dart';

class Plants extends StatefulWidget {
  @override
  _PlantsState createState() => _PlantsState();
}

class _PlantsState extends State<Plants> {
  ScrollController _scrollController;
  List<String> allDescriptions = [
    'Lucky Bamboo is a great air purifying plant. It requires bright, ventilated areas. It tolerates dry air and does not require constant spraying.',
    'Calathea plants are popular for indoor purposes because they are generally easy to care for and they look great.',
    'Jade plants are succulent houseplants, which makes them fairly resilient and easy to grow indoors—plus, they’re long-lived.',
  ];
  String description;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(changeDesc);
    setState(() {
      description = allDescriptions[0];
    });
  }

  void changeDesc() {
    var value = _scrollController.offset.round();
    var descIndex = (value / 150).round();
    if (descIndex < allDescriptions.length) {
      setState(() {
        description = allDescriptions[descIndex];
      });
    }
  }

 ```dart
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 350.0,
          child: ListView(
            padding: EdgeInsets.only(left: 25.0),
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              getPlantCard('assets/images/bamboo1.png', '40', 'Indoor', 'Lucky Bamboo'),
              SizedBox(width: 15.0),
              getPlantCard('assets/images/cl.png', '25', 'Indoor', 'Calathea'),
              SizedBox(width: 15.0),
              getPlantCard('assets/images/jade.png', '30', 'Indoor', 'Jade plant'),
              SizedBox(width: 10.0),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0, top: 10.0),
          child: Text(
            'Description',
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 17.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0, top: 10.0),
          child: Text(
            description,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 17.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget getPlantCard(String imgPath, String price, String plantType, String plantName) {
    return Stack(
      children: <Widget>[
        Container(
          height: 330.0,
          width: 220.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xFF399D63),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Text(
                        'FROM',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8AC7A4),
                        ),
                      ),
                      Text(
                        '\$' + price,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                ],
              ),
              Image(
                image: AssetImage(imgPath),
                height: 165.0,
              ),
              Row(
                children: <Widget>[
                  SizedBox(width: 25.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        plantType,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8AC7A4),
                        ),
                      ),
                      Text(
                        plantName,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  SizedBox(width: 25.0),
                  IconButton(
                    icon: Icon(Icons.wb_sunny_outlined, color: Colors.white),
                    onPressed: () {},
                  ),
                  SizedBox(width: 25.0),
                  IconButton(
                    icon: Icon(Icons.local_fire_department_rounded, color: Colors.white),
                    onPressed: () {},
                  ),
                  SizedBox(width: 25.0),
                  IconButton(
                    icon: Icon(Icons.thermostat_rounded, color: Colors.white),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10.0),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlantDetail()));
                    },
                    child: Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(color: Color(0xFF399D63)),
                      child: Icon(Icons.help_outline, color: Colors.white.withOpacity(0.4), size: 20.0),
                    ),
                  ),
                ```dart
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 90.0, top: 300.0),
          child: Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.black,
            ),
            child: Center(
              child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}