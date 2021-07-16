import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_share_nepal/cubit/portfolio_cubit.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/helper/utilities.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/model/symbol_model.dart';
import 'package:my_share_nepal/reusable/custom_form_field.dart';

class AddPortfolioDialog extends StatefulWidget {
  final SymbolModel symbol;
  AddPortfolioDialog({
    required this.symbol,
  });
  final NumberFormat numberFormat =
      NumberFormat("##,##,##,##,##,##,##,##0.0#", "en_US");
  final DateFormat dateFormat = DateFormat.yMMMMd('en_US');
  final RegExp digitAndDotRegExp = RegExp(r'^\d+\.?\d{0,2}');
  @override
  _AddPortfolioDialogState createState() => _AddPortfolioDialogState();
}

class _AddPortfolioDialogState extends State<AddPortfolioDialog> {
  var _formKey = GlobalKey<FormState>();
  DateTime? purchaseDate;
  TextEditingController quantityTextEditingController = TextEditingController();
  TextEditingController purchasePriceTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    quantityTextEditingController.dispose();
    purchasePriceTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AlertDialog(
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        ),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Add to portfolio',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(150),
                    ),
              ),
              TextSpan(
                text: '\nScroll if options hidden.',
                style: Theme.of(context).textTheme.overline!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(150),
                    ),
              ),
            ],
          ),
        ),
        content: Container(
          height: MediaQuery.of(context).size.width * 0.8,
          width: double.maxFinite,
          child: ListView(
            children: [
              Text(
                'Symbol',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(150),
                    ),
              ),
              Text(
                widget.symbol.symbol,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(150),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Text(
                'Purchase Price',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(150),
                    ),
              ),
              SizedBox(
                height: kDefaultPadding / 4,
              ),
              CustomFormField(
                hint: '0.0',
                textEditingController: purchasePriceTextEditingController,
                keyboardType: TextInputType.number,
                textInputFormatter: [
                  FilteringTextInputFormatter.allow(
                    widget.digitAndDotRegExp,
                  ),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter purchase price of share first';
                  } else if (double.parse(value) <= 0) {
                    return 'Purchase price cannot be zero';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Text(
                'No. of share',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(150),
                    ),
              ),
              SizedBox(
                height: kDefaultPadding / 4,
              ),
              CustomFormField(
                hint: '0',
                textEditingController: quantityTextEditingController,
                keyboardType: TextInputType.number,
                textInputFormatter: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Select number of shares first';
                  } else if (int.parse(value) <= 0) {
                    return 'Number of shares cannot be zero';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Text(
                'Purchase Date',
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(150),
                    ),
              ),
              purchaseDate == null
                  ? Text(
                      'Date and Time not selected so today\'s date and time will be choosen.',
                      style: Theme.of(context).textTheme.overline!.copyWith(
                            color: Colors.red,
                          ),
                    )
                  : Text(
                      widget.dateFormat.format(purchaseDate ?? DateTime.now()),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withAlpha(150),
                          ),
                    ),
              MaterialButton(
                child: purchaseDate == null
                    ? Text('Select Purchase DateText')
                    : Text('Change Purchase Date'),
                onPressed: () async {
                  purchaseDate = await showDatePicker(
                    context: context,
                    initialDate: purchaseDate ?? DateTime.now(),
                    firstDate: DateTime(1950, 1, 1),
                    lastDate: DateTime.now(),
                  );
                  setState(() {});
                },
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
            ],
          ),
        ),
        actions: [
          MaterialButton(
            child: Text('Add'),
            onPressed: () {
              addPortfolio();
            },
          ),
          MaterialButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  addPortfolio() async {
    if (_formKey.currentState!.validate()) {
      try {
        await context.read<PortfolioCubit>().insertSymbol(PortfolioModel(
              symbolModel: widget.symbol,
              purchaseDate: purchaseDate ?? DateTime.now(),
              purchasePrice:
                  double.parse(purchasePriceTextEditingController.text),
              quantity: int.parse(quantityTextEditingController.text),
              symbolId: widget.symbol.id ?? 0,
            ));
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(normalSnackBar(
            context: context,
            content: 'Successfully added ' +
                quantityTextEditingController.text +
                ' share of ' +
                widget.symbol.symbol +
                ' with purchase price of ' +
                widget.numberFormat.format(
                    double.parse(purchasePriceTextEditingController.text)) +
                ' to portfolio.'));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(normalSnackBar(
          context: context,
          content: 'Error adding to portfolio. Try again later.',
          error: true,
        ));
      }
    }
  }
}
