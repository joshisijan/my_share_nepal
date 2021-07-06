import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_share_nepal/constants.dart';
import 'package:my_share_nepal/cubit/theme_cubit.dart';
import 'package:my_share_nepal/theme/theme_list.dart';

class AppColorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 3),
      child: Wrap(
        alignment: WrapAlignment.start,
        children: List.generate(
          kThemeList.length,
          (themeIndex) {
            bool isCurrentTheme = Theme.of(context).primaryColor ==
                kThemeList[themeIndex].primaryColor;
            return Container(
              height: 30.0,
              width: 30.0,
              margin: EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 0.3,
                vertical: kDefaultBorderRadius / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(200),
                  width: isCurrentTheme ? 4.0 : 1.5,
                ),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: MaterialButton(
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
