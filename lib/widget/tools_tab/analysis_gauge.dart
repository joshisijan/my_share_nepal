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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.5;
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
                    (_animationValue * 100).ceil().toString() + '%',
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
          'Analysing',
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          'Analysis Result',
          style: Theme.of(context).textTheme.headline6,
        ),
        MaterialButton(
          child: Text('Stop Animation'),
          onPressed: () {
            _animationController.stop();
          },
        ),
      ],
    );
  }
}
