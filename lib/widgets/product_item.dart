import 'package:flutter/material.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        // Listile을 써도 되지만, 이는 gridview 안에서 특히 잘 작동함
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: id,
            );
            // routeName을 지정해서 해당 경로로 이동하게 하는 것이 더 좋음
            // 만약 push(MaterialPageRoute(builder: (ctx) => ProductDetailScreen(title)))을 쓸 경우,
            // title 말고 id 혹은 price 값을 넣고 싶을 때는 일일이 다 설정해 줘야 하기 때문!!
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            // boxfit.cover takes all the available space it can get
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(Icons.favorite),
            color: Theme.of(context).accentColor,
            onPressed: () {},
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
