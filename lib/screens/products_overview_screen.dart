import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        // whole method is called 되었을 때 rebuild를 또 하지 않기 위해 const 사용 -> which can save you some performance
        // const를 쓸 수 있는한 많은 곳에 써보며 연습하는 것도 좋음
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => ProductItem(
              loadedProducts[i].id,
              loadedProducts[i].title,
              loadedProducts[i].imageUrl,
            ),
            // 'i' is for the index of the item it's currently building a cell for, 
            // that should return the widget that gets built for every grid item we have
            // itemBuilder는 어떻게 every cell이 built될 것인지를 정의
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          // taller than wide 의미함
          crossAxisSpacing: 10,
          // the space between the columns
          mainAxisSpacing: 10,
          // the space bteween the rows
        ),
        // griddelegate은 how many columns it should have를 결정 
        // FixedCrossAxisCount는 내가 certain amount of grid items가 screen에 필요함을 보여주는 수단임
      ),
    );
  }
}
