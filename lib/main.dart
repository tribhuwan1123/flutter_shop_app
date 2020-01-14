import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//custom imports
import 'package:flutter_practice/components/horizontal_listview.dart';
import 'package:flutter_practice/components/products.dart';

void main() {
  runApp(
    new MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  Widget imageCarousel= new Container(
    height: 200.0,
    child: Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/c1.jpg'),
        AssetImage('images/m1.jpeg'),
        AssetImage('images/m2.jpg'),
        AssetImage('images/w1.jpeg'),
        AssetImage('images/w4.jpeg'),
        AssetImage('images/w3.jpeg'),
      ],
      autoplay: true,
      dotSize: 4.0,
      indicatorBgPadding: 4.0,
      dotColor: Colors.red,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 500),
    ),
  );

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: Text('Shop App'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Tribhuwan Kahar'),
              accountEmail: Text('kahartribhuwan01@gmail.com'),
              currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ))),
              decoration: new BoxDecoration(color: Colors.red),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(Icons.dashboard, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite, color: Colors.red),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.blue),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          imageCarousel,
          new Padding(padding: const EdgeInsets.all(8.0),
          child: new Text('Categories'),),
          HorizontalList(),
          new Padding(padding: const EdgeInsets.all(20.0),
            child: new Text('Recent Products'),),
            Container(
              height: 320.0,
              child: Products(),
            )

        ],
      ),
    );
  }
}
