import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/productDetails.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productDetails = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "oldPrice": "150",
      "price": "100"
    },
    {
      "name": "Blazzer",
      "picture": "images/products/blazer2.jpeg",
      "oldPrice": "140",
      "price": "80"
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "oldPrice": "150",
      "price": "100"
    },
    {
      "name": "Black Dress",
      "picture": "images/products/dress2.jpeg",
      "oldPrice": "150",
      "price": "100"
    },
    {
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "oldPrice": "150",
      "price": "100"
    },
    {
      "name": "Hill Shoes",
      "picture": "images/products/hills2.jpeg",
      "oldPrice": "150",
      "price": "100"
    },
    {
      "name": "Pants",
      "picture": "images/products/pants1.jpg",
      "oldPrice": "150",
      "price": "100"
    },
    {
      "name": "Pant",
      "picture": "images/products/pants2.jpeg",
      "oldPrice": "150",
      "price": "100"
    },
    {
      "name": "Shoes",
      "picture": "images/products/shoe1.jpg",
      "oldPrice": "150",
      "price": "100"
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt1.jpeg",
      "oldPrice": "150",
      "price": "100"
    },
    {
      "name": "Skirts",
      "picture": "images/products/skt2.jpeg",
      "oldPrice": "150",
      "price": "100"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productDetails.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
            productName: productDetails[index]['name'],
            productImage: productDetails[index]['picture'],
            price: productDetails[index]['price'],
            oldPrice: productDetails[index]['oldPrice'],
          );
        });
  }
}

class SingleProduct extends StatelessWidget {
  final String productName;
  final String price;
  final String oldPrice;
  final String productImage;

  SingleProduct(
      {this.productName, this.productImage, this.price, this.oldPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new Hero(
        tag: productName,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => ProductDetail(
                  productDetailName: productName,
                  productDetailNewPrice: price,
                  productDetailOldPrice: oldPrice,
                  productDetailImage: productImage,
                ))),
            child: GridTile(
              footer:  Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      productName, style: TextStyle(fontWeight: FontWeight
                        .bold, fontSize: 20.0),),
                  ),
                  new Text("\$${price}",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
                ],
              ),
              child: Image.asset(
                productImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
