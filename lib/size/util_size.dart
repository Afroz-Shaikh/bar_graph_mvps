import 'package:flutter/material.dart';

/// [SizeConfig] to make project scalable
class UiSizeConfig {
  static MediaQueryData? _mediaQueryData;
  static GlobalKey<NavigatorState> navKey = GlobalKey();
  static BuildContext? context;
  static double? screenWidth,
      screenHeight,
      blockSizeHorizontal,
      blockSizeVertical,
      _safeAreaHorizontal,
      _safeAreaVertical,
      safeBlockHorizontal,
      safeBlockVertical,
      profileDrawerWidth,
      refHeight,
      refWidth,
      refMobileHeight,
      refMobileWidth,
      refTabletHeight,
      refTabletWidth;

  static bool get isMobile =>
      (MediaQuery.of(context ?? navKey.currentContext!).size.width < 500)
          ? true
          : false;
  static bool get isTablet =>
      (MediaQuery.of(context ?? navKey.currentContext!).size.width > 500 &&
              MediaQuery.of(navKey.currentContext!).size.width < 1000)
          ? true
          : false;
  static bool get isDesktop =>
      (MediaQuery.of(context ?? navKey.currentContext!).size.width > 1000)
          ? true
          : false;

  void init(BuildContext ctx) {
    _mediaQueryData = MediaQuery.of(ctx);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    refHeight = 1080;
    refWidth = 1920;
    refTabletHeight = 1024;
    refTabletWidth = 768;
    refMobileHeight = 760;
    refMobileWidth = 360;
    context = ctx;

    if (screenHeight! < 1200) {
      blockSizeHorizontal = screenWidth! / 100;
      blockSizeVertical = screenHeight! / 100;

      _safeAreaHorizontal =
          _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
      _safeAreaVertical =
          _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
      safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!) / 100;
      safeBlockVertical = (screenHeight! - _safeAreaVertical!) / 100;
    } else {
      blockSizeHorizontal = screenWidth! / 120;
      blockSizeVertical = screenHeight! / 120;

      _safeAreaHorizontal =
          _mediaQueryData!.padding.left + _mediaQueryData!.padding.right;
      _safeAreaVertical =
          _mediaQueryData!.padding.top + _mediaQueryData!.padding.bottom;
      safeBlockHorizontal = (screenWidth! - _safeAreaHorizontal!) / 120;
      safeBlockVertical = (screenHeight! - _safeAreaVertical!) / 120;
    }
  }

  static double getWidthRatio(double val) {
    if (refWidth != null) {
      double res = (val / refWidth!) * 100;
      return res * blockSizeHorizontal!;
    }
    return val;
  }

  static double getHeightRatio(double val) {
    double res = (val / refHeight!) * 100;
    return res * blockSizeVertical!;
  }

  static double getFontRatio(double val) {
    double res = (val / refWidth!) * 100;
    if (screenWidth! > screenHeight!) {
      return res * safeBlockHorizontal!;
    } else {
      return res * safeBlockVertical!;
    }
  }

  static double getTabletWidthRatio(double val) {
    double res = (val / refTabletWidth!) * 100;
    return res * blockSizeHorizontal!;
  }

  static double getTabletHeightRatio(double val) {
    double res = (val / refTabletHeight!) * 100;
    return res * blockSizeVertical!;
  }

  static double getTabletFontRatio(double val) {
    double res = (val / refTabletWidth!) * 100;
    if (screenWidth! < screenHeight!) {
      return res * safeBlockHorizontal!;
    } else {
      return res * safeBlockVertical!;
    }
  }

  static double getMobileWidthRatio(double val) {
    double res = (val / refMobileWidth!) * 100;
    return res * blockSizeHorizontal!;
  }

  static double getMobileHeightRatio(double val) {
    double res = (val / refMobileHeight!) * 100;
    return res * blockSizeVertical!;
  }

  static double getMobileFontRatio(double val) {
    double res = (val / refMobileWidth!) * 100;
    if (screenWidth! < screenHeight!) {
      return res * safeBlockHorizontal!;
    } else {
      return res * safeBlockVertical!;
    }
  }

  static double getResponsiveFont(double val) {
    if (isMobile) {
      return val.toMobileFont;
    } else if (isTablet) {
      return val.toTabletFont;
    } else {
      return val.toFont! * 0.9;
    }
  }

  static double getResponsiveConstrain(List<double> constrainList,
      [String? type, double? scale]) {
    if (isMobile) {
      return (type == "height")
          ? constrainList[2].toMobileHeight
          : constrainList[2].toMobileWidth * (scale ?? 1);
    } else if (isTablet) {
      return (type == "height")
          ? constrainList[1].toMobileHeight
          : constrainList[1].toTabletWidth * (scale ?? 1);
    } else {
      return (type == "height")
          ? constrainList[0].toHeight
          : constrainList[0].toWidth * (scale ?? 1);
    }
  }

  static double getResponsiveConstrainFont(List<double> constrainList,
      [BuildContext? buildContext, String? type]) {
    context = buildContext;
    if (isMobile) {
      return constrainList[2].toMobileFont;
    } else if (isTablet) {
      return constrainList[1].toTabletFont;
    } else {
      return constrainList[0].toFont;
    }
  }

  static double getResponsiveHeight(double val) {
    if (isMobile) {
      return val.toMobileHeight;
    } else if (isTablet) {
      return val.toTabletHeight;
    } else {
      return val.toHeight;
    }
  }

  static double getResponsiveWidth(double val) {
    if (isMobile) {
      return val.toMobileWidth;
    } else if (isTablet) {
      return val.toTabletWidth;
    } else {
      return val.toWidth;
    }
  }
}

extension SizeUtils on num {
  double get toWidth => UiSizeConfig.getWidthRatio(this.toDouble());

  double get toHeight => UiSizeConfig.getHeightRatio(this.toDouble());

  double get toFont => UiSizeConfig.getFontRatio(this.toDouble());

  double get toTabletWidth => UiSizeConfig.getTabletWidthRatio(this.toDouble());

  double get toTabletHeight =>
      UiSizeConfig.getTabletHeightRatio(this.toDouble());

  double get toTabletFont => UiSizeConfig.getTabletFontRatio(this.toDouble());

  double get toMobileWidth => UiSizeConfig.getMobileWidthRatio(this.toDouble());

  double get toMobileHeight =>
      UiSizeConfig.getMobileHeightRatio(this.toDouble());

  double get toMobileFont => UiSizeConfig.getMobileFontRatio(this.toDouble());

  double get toResponsiveFont =>
      UiSizeConfig.getResponsiveFont(this.toDouble());

  double get toResponsiveHeight =>
      UiSizeConfig.getResponsiveHeight(this.toDouble());

  double get toResponsiveWidth =>
      UiSizeConfig.getResponsiveWidth(this.toDouble());
}
