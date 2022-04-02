import 'package:flutter/material.dart';
import 'package:flutter_sample_jpv/src/UI/sliver_with_tab/models/models.dart';

class SliverBodyItems extends StatelessWidget {
  const SliverBodyItems({
    Key? key,
    required this.listItem,
  }) : super(key: key);

  final List<Product> listItem;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final product = listItem[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                product.description,
                                maxLines: 4,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                product.price,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              product.image,
                            ),
                          ),
                        ),
                        height: 140,
                        width: 130,
                      )
                    ],
                  ),
                ),
                if (index == listItem.length - 1) ...[
                  const SizedBox(height: 32),
                  Container(
                    height: 0.5,
                    color: Colors.white.withOpacity(0.3),
                  )
                ]
              ],
            ),
          );
        },
        childCount: listItem.length,
      ),
    );
  }
}
