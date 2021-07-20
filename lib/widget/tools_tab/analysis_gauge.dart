import 'package:flutter/material.dart';
import 'package:my_share_nepal/helper/constants.dart';

class AnalysisGauge extends StatefulWidget {
  final double? value;
  AnalysisGauge({
    this.value,
  });

  @override
  _AnalysisGaugeState createState() => _AnalysisGaugeState();
}

class _AnalysisGaugeState extends State<AnalysisGauge>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  double _animationValue = 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: kGaugeDuration,
    );
    _animationController.addListener(_onUpdate);
    _animationController.repeat(
      reverse: true,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _onUpdate() {
    setState(() {
      _animationValue = _animationController.value;
    });
  }

  String analysisText(double? value) {
    if (value == null)
      return '';
    else if (value <= 0.4)
      return 'Not Good';
    else if (value > 0.4 && value <= 60)
      return 'Average';
    else
      return 'Good';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.5;
    if (widget.value != null) {
      _animationController.stop();
    }
    return Column(
      children: [
        Align(
          child: Container(
            width: size,
            height: size,
            child: Stack(
              children: [
                Container(
                  width: size,
                  height: size,
                  child: CircularProgressIndicator(
                    strokeWidth: kGaugeWidth,
                    color: ColorTween(
                      begin: Colors.red,
                      end: Colors.green,
                    ).animate(_animationController).value,
                    value: widget.value ?? _animationValue,
                  ),
                ),
                Center(
                  child: Text(
                    ((widget.value ?? _animationValue) * 100)
                            .ceil()
                            .toString() +
                        '%',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorTween(
                            begin: Colors.red,
                            end: Colors.green,
                          ).animate(_animationController).value,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: kDefaultPadding),
        Text(
          widget.value == null ? 'Analysing' : 'Analysis Result',
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          widget.value == null ? 'It may take some time' : '',
          style: Theme.of(context).textTheme.overline,
        ),
        Text(
          analysisText(widget.value),
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: ColorTween(
                  begin: Colors.red,
                  end: Colors.green,
                ).animate(_animationController).value,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
