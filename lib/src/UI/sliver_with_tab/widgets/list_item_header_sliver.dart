import 'package:flutter/material.dart';
import 'package:flutter_sample_jpv/src/UI/sliver_with_tab/controller/controller.dart';
import 'package:flutter_sample_jpv/src/UI/sliver_with_tab/models/models.dart';
import 'package:flutter_sample_jpv/src/UI/sliver_with_tab/widgets/widgets.dart';

class ListItemHeaderSliver extends StatelessWidget {
  const ListItemHeaderSliver({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final SliverScrollController bloc;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final itemsOffset = bloc.listOffSetItemHeader;

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) => true,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              right: size.width -
                  (itemsOffset[itemsOffset.length - 1] -
                      itemsOffset[itemsOffset.length - 2])),
          physics: const NeverScrollableScrollPhysics(),
          controller: bloc.scrollControllerItemHeader,
          scrollDirection: Axis.horizontal,
          child: ValueListenableBuilder(
            valueListenable: bloc.headerNotifier,
            builder: (context, MyHeader? snapshot, __) {
              return Row(
                children: List.generate(
                  bloc.listCategory.length,
                  (index) {
                    return GetBoxOffset(
                      offset: (offSet) {
                        return itemsOffset[index] = offSet.dx;
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 8,
                          bottom: 8,
                          right: 8,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: index == snapshot!.index ? Colors.white : null,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          bloc.listCategory[index].category,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: index == snapshot.index
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
