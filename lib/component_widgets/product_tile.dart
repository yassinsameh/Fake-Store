import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/palette.dart';
import '../core/theme.dart';
import '../products_feature/models/product.dart';
import '../products_feature/products_controller.dart';

class ProductTile extends ConsumerStatefulWidget {
  final Product product;
  final Function onPressedAddition;
  final Function onPressedSubtraction;
  final int quantitySelected;
  final bool isLoading;
  final bool hideQuantitySection;
  final VoidCallback onTap;
  final int? maxLines;
  final TextOverflow overflow;
  const ProductTile(
      {required this.product,
      required this.onPressedAddition,
      required this.onTap,
      this.maxLines = 3,
      this.overflow = TextOverflow.ellipsis,
      required this.isLoading,
      required this.onPressedSubtraction,
      required this.quantitySelected,
      this.hideQuantitySection = false,
      super.key});

  @override
  ProductTileState createState() => ProductTileState();
}

class ProductTileState extends ConsumerState<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: widget.onTap,
        leading: CachedNetworkImage(
          height: 40,
          width: 40,
          imageUrl: widget.product.image,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        title: Text(
          widget.product.title,
          maxLines: widget.maxLines,
          overflow: widget.overflow,
          style: AppTheme.textThemes.bodyLarge,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Palette.primaryColor6,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "${widget.product.price.toStringAsFixed(2)}\$",
                    style: AppTheme.textThemes.bodyLarge
                        ?.copyWith(color: Palette.whiteText),
                  ),
                ),
              ),
            ],
          ),
        ),
        trailing: widget.hideQuantitySection
            ? null
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () async {
                        try {
                          await widget.onPressedSubtraction.call();
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())));
                        }
                      },
                      icon: Text(
                        '-',
                        style: AppTheme.textThemes.titleLarge,
                      )),
                  widget.isLoading
                      ? const SizedBox(
                          height: 13,
                          width: 13,
                          child: CircularProgressIndicator(
                            color: Palette.primaryColor1,
                            strokeWidth: 1,
                          ))
                      : Text(
                          widget.quantitySelected.toString(),
                          style: AppTheme.textThemes.titleLarge,
                        ),
                  IconButton(
                    onPressed: () async {
                      try {
                        await widget.onPressedAddition.call();
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Palette.primaryColor1,
                    ),
                  ),
                ],
              ));
  }
}
