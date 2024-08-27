import 'package:flutter/material.dart';
import 'package:grocery/features/menu/presentation/widgets/custom_outlined_button.dart';
import 'package:grocery/features/menu/presentation/widgets/favorite_button.dart';
import 'package:grocery/features/menu/presentation/widgets/icon_button.dart';

import '../../domain/entities/option.dart';
import '../../domain/entities/product.dart';
import '../widgets/back_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/image_loader.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int countOrder = 1;
  late List<bool> _checkboxValues;

  @override
  void initState() {
    _checkboxValues = List<bool>.filled(widget.product.options.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(children: [
                  imageLoader(widget.product.imageUrl, height: 300),
                  BackButtonWidget.backButtonWidget(
                    iconColor: Colors.black,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Positioned(
                    bottom: 20,
                    right: 20,
                    child: FavoriteButton.favoriteButton(
                      iconColor: Color(0xFFFF6347),
                    ),
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              CustomText(
                                text: widget.product.title,
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              if (widget.product.discount > 0)
                                CustomText(
                                  text: '£ ${widget.product.price.toString()}',
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomText(
                                text:
                                    '£ ${widget.product.price - widget.product.discount}',
                                color: const Color(0xFFFF6347),
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow[700],
                              ),
                              CustomText(
                                text: widget.product.rating.toString(),
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const CustomText(
                                text: '(1.205)',
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: const CustomText(
                                  text: 'See all review',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.grey,
                                  decoration: TextDecoration.underline,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: CustomText(
                              text: widget.product.description,
                              color: Colors.grey,
                              maxLines: 3,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: const CustomText(
                                text: 'See more',
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.grey,
                                decoration: TextDecoration.underline,
                              ),
                            )
                          ],
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                            text: 'Additional Options:',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Column(
                          children: widget.product.options.asMap().entries.map(
                            (entry) {
                              int index = entry.key;
                              Option option = entry.value;

                              return Row(
                                children: [
                                  CustomText(
                                    text: option.name,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const Spacer(),
                                  CustomText(
                                    text: '+ £${option.price}',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                  Checkbox(
                                    value: _checkboxValues[index],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _checkboxValues[index] = value ?? false;
                                      });
                                    },
                                  ),
                                ],
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Card(
                elevation: 10,
                margin: const EdgeInsets.all(20),
                child: SizedBox(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconsButton(
                          iconColor: Colors.black,
                          icon: const Icon(
                            Icons.remove,
                            size: 30,
                          ),
                          onTap: () {
                            if (countOrder > 1) {
                              setState(() {
                                countOrder -= 1;
                              });
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: '$countOrder',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        CustomIconsButton(
                          iconColor: Colors.black,
                          icon: const Icon(
                            Icons.add,
                            size: 30,
                          ),
                          onTap: () {
                            setState(() {
                              countOrder += 1;
                            });
                          },
                        ),
                        const Spacer(),
                        CustomOutlinedButton(text: 'Add to Basket')
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
