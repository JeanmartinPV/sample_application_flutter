import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jpv_flutter/src/ui/sliver_with_tab/data/data.dart';
import 'package:jpv_flutter/src/ui/sliver_with_tab/models/models.dart';

class SliverScrollController {
  //List of products - Lista de productos
  late List<ProductCategory> listCategory;

  //list of offSet values - Lista de valores offSet de los item
  List<double> listOffSetItemHeader = [];

  //Header notifier - Notificaciones de cabereca
  final headerNotifier = ValueNotifier<MyHeader?>(null);

  //Global Offset Value - Valor actual de scroll
  final globalOffsetValue = ValueNotifier<double>(0);

  //Indicador si estamos bajando o subiendo en el app
  //Indicator if we are going down or up in the application
  final goingDown = ValueNotifier<bool>(false);

  // Valor para hacer la validaciones de los iconos superiores
  final valueScroll = ValueNotifier<double>(0);

  // Para mover los items superiores en sliver - To move the top category bar
  late ScrollController scrollControllerItemHeader;

  // To have overall control of scrolling - To have overall control of scrolling
  late ScrollController scrollControllerGlobally;

  // Valor que indica si el encabezado es visible
  // Value that indicates if the header is visible
  final visibleHeader = ValueNotifier(false);

  void loadDataRandom() {
    final productsTwo = [...products];
    final productsThree = [...products];
    final productsFour = [...products];

    productsTwo.shuffle();
    productsThree.shuffle();
    productsFour.shuffle();

    listCategory = [
      ProductCategory(
        category: 'Order Again',
        products: products,
      ),
      ProductCategory(
        category: 'Picked For You',
        products: productsTwo,
      ),
      ProductCategory(
        category: 'Startes',
        products: productsThree,
      ),
      ProductCategory(
        category: 'Gimpub Sushi',
        products: productsFour,
      ),
    ];
  }

  void init() {
    loadDataRandom();
    listOffSetItemHeader =
        List.generate(listCategory.length, (index) => index.toDouble());

    scrollControllerGlobally = ScrollController();
    scrollControllerItemHeader = ScrollController();

    headerNotifier.addListener(_listenHeaderNotifier);
    scrollControllerGlobally.addListener(_listenToScrollChange);
    visibleHeader.addListener(_listenVisibleHeader);
  }

  void _listenVisibleHeader() {
    if (visibleHeader.value) {
      headerNotifier.value = const MyHeader(visible: false, index: 0);
    }
  }

  void dispose() {
    scrollControllerItemHeader.dispose();
    scrollControllerGlobally.dispose();
  }

  void _listenHeaderNotifier() {
    if (visibleHeader.value) {
      for (var i = 0; i < listCategory.length; i++) {
        scrollAnimationHorizontal(index: i);
      }
    }
  }

  void _listenToScrollChange() {
    globalOffsetValue.value = scrollControllerGlobally.offset;
    if (scrollControllerGlobally.position.userScrollDirection ==
        ScrollDirection.reverse) {
      goingDown.value = true;
    } else {
      goingDown.value = false;
    }
  }

  void scrollAnimationHorizontal({required int index}) {
    if (headerNotifier.value?.index == index && headerNotifier.value!.visible) {
      scrollControllerItemHeader.animateTo(
        listOffSetItemHeader[headerNotifier.value!.index] - 16,
        duration: const Duration(milliseconds: 500),
        curve: goingDown.value ? Curves.bounceOut : Curves.fastOutSlowIn,
      );
    }
  }

  void refreshHeader(
    int index,
    bool visible, {
    int? lastIndex,
  }) {
    final headerValue = headerNotifier.value;
    final headerTitle = headerValue?.index ?? index;
    final headerVisible = headerValue?.visible ?? false;

    if (headerTitle != index || lastIndex != null || headerVisible != visible) {
      Future.microtask(
        () {
          if (!visible && lastIndex != null) {
            headerNotifier.value = MyHeader(
              visible: true,
              index: lastIndex,
            );
          } else {
            headerNotifier.value = MyHeader(
              visible: visible,
              index: index,
            );
          }
        },
      );
    }
  }
}
