import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final productDetailName;
  final productDetailNewPrice;
  final productDetailOldPrice;
  final productDetailImage;

  ProductDetail(
      {this.productDetailName,
      this.productDetailNewPrice,
      this.productDetailOldPrice,
      this.productDetailImage});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: Text('Product Details'),
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
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.productDetailName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    widget.productDetailNewPrice,
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    widget.productDetailOldPrice,
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.lineThrough),
                  ),
                ),
              ),
              child: Image.asset(
                widget.productDetailImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Size"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),

                      )

                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Color"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),

                      )

                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Qty"),
                      ),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down),

                      )

                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: new Text("Buy now"),
                ),
              ),
              new IconButton(icon: Icon(Icons.add_shopping_cart) , color: Colors.red,onPressed: (){}),
              new IconButton(icon: Icon(Icons.favorite_border) , color: Colors.red,onPressed: (){})

            ],
          )
        ],
      ),
    );
  }
}
