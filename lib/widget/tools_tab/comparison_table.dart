import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/cubit/tools/cubit/symbol_comparison_cubit.dart';
import 'package:my_share_nepal/model/symbol_model.dart';
import 'package:my_share_nepal/reusable/text_icon_button.dart';

class ComparisonTable extends StatelessWidget {
  final SymbolModel symbolModelOne;
  final SymbolModel? symbolModelTwo;
  ComparisonTable({
    required this.symbolModelOne,
    this.symbolModelTwo,
  });

  final NumberFormat numberFormat =
      NumberFormat("##,##,##,##,##,##,##,##0.0#", "en_US");

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DataTable(
          columnSpacing: 1.0,
          dataTextStyle: Theme.of(context).textTheme.bodyText1,
          columns: [
            DataColumn(
              label: Text(''),
            ),
            DataColumn(
              label: IconTextButton(
                icon: Icons.clear,
                label: 'Remove',
                isError: true,
                onPressed: () {
                  context.read<SymbolComparisonCubit>().removeSymbol(0);
                },
              ),
            ),
            DataColumn(
              label: symbolModelTwo == null
                  ? SizedBox.shrink()
                  : IconTextButton(
                      icon: Icons.clear,
                      label: 'Remove',
                      isError: true,
                      onPressed: () {
                        context.read<SymbolComparisonCubit>().removeSymbol(1);
                      },
                    ),
            ),
          ],
          rows: [
            DataRow(
              color: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColorLight.withAlpha(50),
              ),
              cells: [
                DataCell(
                  Text('Symbol'),
                ),
                DataCell(
                  Text(symbolModelOne.symbol),
                ),
                DataCell(
                  Text(
                    symbolModelTwo == null
                        ? 'Not Added'
                        : symbolModelTwo!.symbol,
                  ),
                ),
              ],
            ),
            DataRow(
              color: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor.withAlpha(70),
              ),
              cells: [
                DataCell(
                  Text('Open'),
                ),
                DataCell(
                  Text(numberFormat.format(symbolModelOne.open)),
                ),
                DataCell(
                  Text(
                    symbolModelTwo == null
                        ? 'Not Added'
                        : numberFormat.format(symbolModelTwo!.open),
                  ),
                ),
              ],
            ),
            DataRow(
              color: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColorLight.withAlpha(50),
              ),
              cells: [
                DataCell(
                  Text('High'),
                ),
                DataCell(
                  Text(numberFormat.format(symbolModelOne.high)),
                ),
                DataCell(
                  Text(
                    symbolModelTwo == null
                        ? 'Not Added'
                        : numberFormat.format(symbolModelTwo!.high),
                  ),
                ),
              ],
            ),
            DataRow(
              color: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor.withAlpha(70),
              ),
              cells: [
                DataCell(
                  Text('Low'),
                ),
                DataCell(
                  Text(numberFormat.format(symbolModelOne.low)),
                ),
                DataCell(
                  Text(
                    symbolModelTwo == null
                        ? 'Not Added'
                        : numberFormat.format(symbolModelTwo!.low),
                  ),
                ),
              ],
            ),
            DataRow(
              color: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColorLight.withAlpha(50),
              ),
              cells: [
                DataCell(
                  Text('Close'),
                ),
                DataCell(
                  Text(numberFormat.format(symbolModelOne.close)),
                ),
                DataCell(
                  Text(
                    symbolModelTwo == null
                        ? 'Not Added'
                        : numberFormat.format(symbolModelTwo!.close),
                  ),
                ),
              ],
            ),
            DataRow(
              color: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor.withAlpha(70),
              ),
              cells: [
                DataCell(
                  Text('Volume'),
                ),
                DataCell(
                  Text(numberFormat.format(symbolModelOne.volume)),
                ),
                DataCell(
                  Text(
                    symbolModelTwo == null
                        ? 'Not Added'
                        : numberFormat.format(symbolModelTwo!.volume),
                  ),
                ),
              ],
            ),
            DataRow(
              color: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColorLight.withAlpha(50),
              ),
              cells: [
                DataCell(
                  Text('Previous Close'),
                ),
                DataCell(
                  Text(numberFormat.format(symbolModelOne.previousClose)),
                ),
                DataCell(
                  Text(
                    symbolModelTwo == null
                        ? 'Not Added'
                        : numberFormat.format(symbolModelTwo!.previousClose),
                  ),
                ),
              ],
            ),
            DataRow(
              color: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor.withAlpha(70),
              ),
              cells: [
                DataCell(
                  Text('Turnover'),
                ),
                DataCell(
                  Text(numberFormat.format(symbolModelOne.turnover)),
                ),
                DataCell(
                  Text(
                    symbolModelTwo == null
                        ? 'Not Added'
                        : numberFormat.format(symbolModelTwo!.turnover),
                  ),
                ),
              ],
            ),
            DataRow(
              color: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColorLight.withAlpha(50),
              ),
              cells: [
                DataCell(
                  Text('Transactions'),
                ),
                DataCell(
                  Text(numberFormat.format(symbolModelOne.transactions)),
                ),
                DataCell(
                  Text(
                    symbolModelTwo == null
                        ? 'Not Added'
                        : numberFormat.format(symbolModelTwo!.transactions),
                  ),
                ),
              ],
            ),
            DataRow(
              color: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor.withAlpha(70),
              ),
              cells: [
                DataCell(
                  Text('Difference'),
                ),
                DataCell(
                  Text(numberFormat.format(symbolModelOne.difference)),
                ),
                DataCell(
                  Text(
                    symbolModelTwo == null
                        ? 'Not Added'
                        : numberFormat.format(symbolModelTwo!.difference),
                  ),
                ),
              ],
            ),
            DataRow(
              color: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColorLight.withAlpha(50),
              ),
              cells: [
                DataCell(
                  Text('Difference Percentage'),
                ),
                DataCell(
                  Text(
                      numberFormat.format(symbolModelOne.differencePercentage)),
                ),
                DataCell(
                  Text(
                    symbolModelTwo == null
                        ? 'Not Added'
                        : numberFormat
                            .format(symbolModelTwo!.differencePercentage),
                  ),
                ),
              ],
            ),
            DataRow(
              color: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColor.withAlpha(70),
              ),
              cells: [
                DataCell(
                  Text('52 Weeks High'),
                ),
                DataCell(
                  Text(numberFormat.format(symbolModelOne.fiftyTwoWeeksHigh)),
                ),
                DataCell(
                  Text(
                    symbolModelTwo == null
                        ? 'Not Added'
                        : numberFormat
                            .format(symbolModelTwo!.fiftyTwoWeeksHigh),
                  ),
                ),
              ],
            ),
            DataRow(
              color: MaterialStateProperty.all<Color>(
                Theme.of(context).primaryColorLight.withAlpha(50),
              ),
              cells: [
                DataCell(
                  Text('52 Weeks Low'),
                ),
                DataCell(
                  Text(numberFormat.format(symbolModelOne.fiftyTwoWeeksLow)),
                ),
                DataCell(
                  Text(
                    symbolModelTwo == null
                        ? 'Not Added'
                        : numberFormat.format(symbolModelTwo!.fiftyTwoWeeksLow),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
