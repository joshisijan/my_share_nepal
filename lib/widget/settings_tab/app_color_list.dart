import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/helper/constants.dart';
import 'package:my_share_nepal/cubit/theme_cubit.dart';
import 'package:my_share_nepal/theme/theme.dart';

class AppColorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: List.generate(
          kThemeList.length,
          (themeIndex) {
            bool isCurrentTheme = Theme.of(context).primaryColor ==
                kThemeList[themeIndex].primaryColor;
            bool isDark = Theme.of(context).brightness == Brightness.dark;
            return AnimatedContainer(
              duration: kDefaultDuration,
              curve: kDefaultCurve,
              height: isCurrentTheme ? 40.0 : 30.0,
              width: isCurrentTheme ? 40.0 : 30.0,
              margin: EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 0.3,
                vertical: kDefaultBorderRadius / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColorLight,
                  width: isCurrentTheme
                      ? 4.0
                      : isDark
                          ? 2.0
                          : 0.0,
                ),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  color: kThemeList[themeIndex].primaryColor,
                  onPressed: () {
                    context.read<ThemeCubit>().changeTheme(themeIndex);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
