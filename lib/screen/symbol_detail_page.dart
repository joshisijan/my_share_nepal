import 'package:flutter/material.dart';
import 'package:my_share_nepal/model/symbol_model.dart';

class SymbolDetailPage extends StatelessWidget {
  final SymbolModel? symbolModel;
  SymbolDetailPage({
    required this.symbolModel,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          symbolModel!.symbol,
        ),
      ),
    );
  }
}
