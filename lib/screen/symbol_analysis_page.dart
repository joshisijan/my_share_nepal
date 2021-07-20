import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/model/symbol_model.dart';
import 'package:my_share_nepal/widget/tools_tab/analysis_gauge.dart';

class SymbolAnalysisPage extends StatefulWidget {
  final SymbolModel? symbolModel;
  SymbolAnalysisPage({
    required this.symbolModel,
  });

  @override
  _SymbolAnalysisPageState createState() => _SymbolAnalysisPageState();
}

class _SymbolAnalysisPageState extends State<SymbolAnalysisPage> {
  double rangeValue = 0; // change to statess later
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.symbolModel!.symbol,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(kDefaultPadding),
        children: [
          SizedBox(
            height: kDoublePadding,
          ),
          Text(
            'Analysis \nof \n' + widget.symbolModel!.symbol,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
          ),
          SizedBox(
            height: kDoublePadding,
          ),
          AnalysisGauge(),
        ],
      ),
    );
  }
}
