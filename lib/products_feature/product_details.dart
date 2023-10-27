import 'package:fake_store/component_widgets/product_tile.dart';
import 'package:fake_store/core/scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/product.dart';

class ProductDetails extends ConsumerStatefulWidget {
  static const name = "product-details";
  final Product product;
  const ProductDetails({required this.product, super.key});

  @override
  ProductDetailsState createState() => ProductDetailsState();
}

class ProductDetailsState extends ConsumerState<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return GeneralScaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          ProductTile(
              hideQuantitySection: true,
              maxLines: null,
              overflow: TextOverflow.visible,
              product: widget.product,
              onPressedAddition: () {},
              onTap: () {},
              isLoading: false,
              onPressedSubtraction: () {},
              quantitySelected: 0),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text("Description: "),
              SizedBox(
                width: 20,
              ),
              Flexible(child: Text(widget.product.title)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text("Review: "),
              SizedBox(
                width: 20,
              ),
              Text("${widget.product.rating.rate.toStringAsFixed(2)}"),
            ],
          ),
        ],
      ),
    ));
  }
}
