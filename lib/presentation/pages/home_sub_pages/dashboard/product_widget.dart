import 'package:flutter/material.dart';
import 'package:flutter_universal_base/business/domain/product_model.dart';
import 'package:flutter_universal_base/di/main_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../../../utils/extensions/views.dart';

class ProductWidget extends StatefulWidget {
  ProductModel productModel;

  ProductWidget({required this.productModel});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.all(0),
      color: Colors.white30,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Card(
                    color: Colors.transparent,
                    borderOnForeground: false,
                    clipBehavior: Clip.antiAlias,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: networkImage(
                      widget.productModel.url,
                      height: 100,
                      width: 100,
                    )),
                Positioned(
                  left: 85,
                  top: 6,
                  child: headerText('\$5', 10, color: Colors.white70),
                )
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    height: 25,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: titleText(widget.productModel.title, 9.5)),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.brown.shade700.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(15)),
                          child: InkWell(
                            splashColor: Colors.white,
                            hoverColor: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            onTap: () {
                              Provider.of<MainViewModel>(context, listen: false).addItemToCart(widget.productModel);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(2),
                              child: Icon(
                                Icons.add_outlined,
                                color: Colors.white,
                                size: 10,
                              ),
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
