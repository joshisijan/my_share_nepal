import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_share_nepal/cubit/portfolio/portfolio_cubit.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/helper/utilities.dart';
import 'package:my_share_nepal/model/portfolio_model.dart';
import 'package:my_share_nepal/reusable/custom_form_field.dart';

class EditPortfolioDialog extends StatefulWidget {
  final PortfolioModel portfolioModel;
  EditPortfolioDialog({
    required this.portfolioModel,
  });
  final NumberFormat numberFormat =
      NumberFormat("##,##,##,##,##,##,##,##0.0#", "en_US");
  final DateFormat dateFormat = DateFormat.yMMMMd('en_US');
  final RegExp digitAndDotRegExp = RegExp(r'^\d+\.?\d{0,2}');
  @override
  _EditPortfolioDialogState createState() => _EditPortfolioDialogState();
}

class _EditPortfolioDialogState extends State<EditPortfolioDialog> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController quantityTextEditingController = TextEditingController();
  TextEditingController purchasePriceTextEditingController =
      TextEditingController();
  DateTime? purchaseDate;

  @override
  void dispose() {
    quantityTextEditingController.dispose();
    purchasePriceTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    quantityTextEditingController.text =
        widget.portfolioModel.quantity.toString();
    purchasePriceTextEditingController.text =
        widget.portfolioModel.purchasePrice.toString();
    return Form(
      key: _formKey,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
        ),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Edit portfolio',
                style: Theme.of(context).textTheme.headline6,
              ),
              TextSpan(
                text: '\nScroll if options hidden.',
                style: Theme.of(context).textTheme.overline,
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
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                widget.portfolioModel.symbolModel!.symbol,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Text(
                'Purchase Price',
                style: Theme.of(context).textTheme.caption,
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
                style: Theme.of(context).textTheme.caption,
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
                style: Theme.of(context).textTheme.caption,
              ),
              Text(
                widget.dateFormat
                    .format(purchaseDate ?? widget.portfolioModel.purchaseDate),
                style: Theme.of(context).textTheme.headline6,
              ),
              MaterialButton(
                child: Text('Change Purchase Date'),
                textColor: Theme.of(context).primaryColor,
                onPressed: () async {
                  purchaseDate = await showDatePicker(
                        context: context,
                        initialDate:
                            purchaseDate ?? widget.portfolioModel.purchaseDate,
                        firstDate: DateTime(1950, 1, 1),
                        lastDate: DateTime.now(),
                      ) ??
                      DateTime.now();
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
            child: Text('Edit'),
            onPressed: () {
              editPortfolio();
            },
          ),
          MaterialButton(
            child: Text('Cancel'),
            textColor: Theme.of(context).errorColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  editPortfolio() async {
    if (_formKey.currentState!.validate()) {
      try {
        await context.read<PortfolioCubit>().updateSymbol(PortfolioModel(
              id: widget.portfolioModel.id,
              symbolModel: widget.portfolioModel.symbolModel,
              purchaseDate: purchaseDate ?? widget.portfolioModel.purchaseDate,
              purchasePrice:
                  double.parse(purchasePriceTextEditingController.text),
              quantity: int.parse(quantityTextEditingController.text),
              symbolId: widget.portfolioModel.symbolModel!.id ?? 0,
            ));
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(normalSnackBar(
            context: context, content: 'Successfully edited portfolio'));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(normalSnackBar(
          context: context,
          content: 'Error editing portfolio. Try again later.',
          error: true,
        ));
      }
    }
  }
}
