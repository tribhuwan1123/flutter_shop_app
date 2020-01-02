import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HorizontalList extends StatefulWidget {
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageCaption: 'shirt',
            imageLocation: 'images/cats/tshirt.png',
          ),
          Category(
            imageCaption: 'Jeans',
            imageLocation: 'images/cats/jeans.png',
          ),
          Category(
            imageCaption: 'Dress',
            imageLocation: 'images/cats/dress.png',
          ),
          Category(
            imageCaption: 'Formals',
            imageLocation: 'images/cats/formal.png',
          ),
          Category(
            imageCaption: 'Casuals',
            imageLocation: 'images/cats/informal.png',
          ),
          Category(
            imageCaption: 'Accessories',
            imageLocation: 'images/cats/accessories.png',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({this.imageCaption, this.imageLocation});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 100.0,
            child: new ListTile(
              title: Image.asset(
                imageLocation,
                width: 80.0,
                height: 80.0,
              ),
              subtitle: Container(
                child: Text(imageCaption),
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ));
  }
}
