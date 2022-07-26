import 'package:flutter/material.dart';
import 'package:mobile/controller/provider/sale_provider.dart';
import 'package:mobile/data/model/sale/sale_model.dart';
import 'sale_text_form_field.dart';

class SaleDetailWidget extends StatefulWidget {
  final SaleModel saleModel;
  final SaleProvider saleProvider;

  const SaleDetailWidget(
      {Key? key, required this.saleModel, required this.saleProvider})
      : super(key: key);

  @override
  State<SaleDetailWidget> createState() => _SaleDetailWidgetState();
}

class _SaleDetailWidgetState extends State<SaleDetailWidget> {
  final TextEditingController nameCtrl = TextEditingController();

  final TextEditingController classificationCtrl = TextEditingController();

  final TextEditingController priceCtrl = TextEditingController();

  final TextEditingController statusCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SaleTextFormField(
                        controller: nameCtrl,
                        errorMessage: 'Please set menu',
                        hintText: 'Menu',
                        textInputType: TextInputType.name,
                        iconData: Icons.category),
                    SaleTextFormField(
                      controller: classificationCtrl,
                      errorMessage: 'Please set classification name',
                      hintText: 'Menu Classification',
                      textInputType: TextInputType.name,
                      iconData: Icons.category,
                    ),
                    SaleTextFormField(
                      controller: priceCtrl,
                      errorMessage: 'Please set price',
                      hintText: 'Price',
                      textInputType: TextInputType.number,
                      iconData: Icons.monetization_on,
                    ),
                    SaleTextFormField(
                      controller: priceCtrl,
                      errorMessage: 'Please set amount',
                      hintText: 'Amount',
                      textInputType: TextInputType.number,
                      iconData: Icons.monetization_on,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        maximumSize: const Size(double.infinity, 56),
                        minimumSize: const Size(double.infinity, 56),
                      ),
                      onPressed: () async {},
                      child: Text("Update".toUpperCase()),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
