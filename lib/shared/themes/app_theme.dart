import 'package:flutter/material.dart';
import 'package:moli_app/constants/color_palattes.dart';
import 'package:moli_app/shared/themes/typography_data.dart';

class MoliTheme {
  const MoliTheme._();

  /// Light
  static ThemeData lighTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppTypography.montserrat,
    colorScheme: lightColorScheme,
    textTheme: AppTypography.lightText,
    /* navigationBarTheme: NavigationBarThemeData(
      backgroundColor: lightColorScheme.background,
      elevation: 0,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      indicatorColor: ColorPalattes.primary95,
      labelTextStyle:
          MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppTypography.lightText.labelMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: lightColorScheme.primary,
          );
        }

        return AppTypography.lightText.labelMedium!.copyWith(
          fontWeight: FontWeight.w500,
          color: lightColorScheme.onSurfaceVariant,
        );
      }),
    ), */
  );

  /// Dark
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppTypography.montserrat,
    colorScheme: darkColorScheme,
    textTheme: AppTypography.darkText,
    /* navigationBarTheme: NavigationBarThemeData(
      backgroundColor: darkColorScheme.background,
      elevation: 0,
      labelTextStyle: MaterialStateTextStyle.resolveWith(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return AppTypography.darkText.labelMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: darkColorScheme.primary,
            );
          }
          return AppTypography.darkText.labelMedium!.copyWith(
            fontWeight: FontWeight.w500,
            color: darkColorScheme.onSurfaceVariant,
          );
        },
      ),
    ), */
  );

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: ColorPalettes.primary40,
    onPrimary: ColorPalettes.white,
    primaryContainer: ColorPalettes.primary90,
    onPrimaryContainer: ColorPalettes.primary10,
    inversePrimary: ColorPalettes.primary80,
    secondary: ColorPalettes.secondary40,
    onSecondary: ColorPalettes.white,
    secondaryContainer: ColorPalettes.secondary90,
    onSecondaryContainer: ColorPalettes.secondary10,
    tertiary: ColorPalettes.tertiary40,
    onTertiary: ColorPalettes.white,
    tertiaryContainer: ColorPalettes.tertiary90,
    onTertiaryContainer: ColorPalettes.tertiary10,
    error: ColorPalettes.error40,
    onError: ColorPalettes.white,
    errorContainer: ColorPalettes.error90,
    onErrorContainer: ColorPalettes.error10,
    background: ColorPalettes.neutral99,
    onBackground: ColorPalettes.neutral10,
    surface: ColorPalettes.neutral99,
    onSurface: ColorPalettes.neutral10,
    surfaceVariant: ColorPalettes.neutralVariant90,
    onSurfaceVariant: ColorPalettes.neutralVariant30,
    outline: ColorPalettes.neutralVariant50,
    inverseSurface: ColorPalettes.neutral20,
    onInverseSurface: ColorPalettes.neutral95,
    shadow: ColorPalettes.black,
    surfaceTint: ColorPalettes.primary40,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: ColorPalettes.primary80,
    onPrimary: ColorPalettes.primary20,
    primaryContainer: ColorPalettes.primary30,
    onPrimaryContainer: ColorPalettes.primary90,
    inversePrimary: ColorPalettes.primary40,
    secondary: ColorPalettes.secondary80,
    onSecondary: ColorPalettes.secondary20,
    secondaryContainer: ColorPalettes.secondary30,
    onSecondaryContainer: ColorPalettes.secondary90,
    tertiary: ColorPalettes.tertiary80,
    onTertiary: ColorPalettes.tertiary20,
    tertiaryContainer: ColorPalettes.tertiary30,
    onTertiaryContainer: ColorPalettes.tertiary90,
    error: ColorPalettes.error80,
    onError: ColorPalettes.error20,
    errorContainer: ColorPalettes.error30,
    onErrorContainer: ColorPalettes.error90,
    background: ColorPalettes.neutral10,
    onBackground: ColorPalettes.neutral90,
    surface: ColorPalettes.neutral10,
    onSurface: ColorPalettes.neutral90,
    surfaceVariant: ColorPalettes.neutralVariant30,
    onSurfaceVariant: ColorPalettes.neutralVariant80,
    outline: ColorPalettes.neutralVariant60,
    inverseSurface: ColorPalettes.neutral90,
    onInverseSurface: ColorPalettes.neutral20,
    shadow: ColorPalettes.black,
    surfaceTint: ColorPalettes.primary40,
  );
}
