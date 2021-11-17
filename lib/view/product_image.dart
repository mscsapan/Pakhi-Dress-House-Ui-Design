import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pakhi_dress_house/model/product_list.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: images.length,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        itemBuilder: (context, index) {
          return Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(images[index], fit: BoxFit.cover)));
        },
        staggeredTileBuilder: (index) => index % 3 == 0
            ? StaggeredTile.count(3, 3)
            : StaggeredTile.count(1, 2),
      ),
    );
  }
}
