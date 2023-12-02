import 'package:delivery/routes/navigation_keys.dart';
import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  ThemeData get themeData => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  Color get primaryColor => themeData.primaryColor;

  Color get transparent => Colors.transparent;
  Color get blackColor => Colors.black;
  Color get whiteColor => Colors.white;
  Size get screenSize => MediaQuery.of(this).size;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  showBottomSheet(Widget child,
      {bool isScrollControlled = false, bool isDismissible = true}) =>
      showModalBottomSheet(
        context: this,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        isDismissible: isDismissible,
        isScrollControlled: isScrollControlled,
        builder: (context) => child,
      );

  void showErrorSnackBar(dynamic error) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(
        content: Center(child: Text("$error")),
      ));

  bool showSuccessSnackBar(dynamic message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Center(child: Text("$message")),
      backgroundColor: Colors.green,
    ));

    return true;
  }

  NavigatorState get _appNavigatorState =>
      NavigationKeys.appNavigationKey.currentState!;

  void pop<T>([T? result, bool useRootNavigator = false]) => useRootNavigator
      ? _appNavigatorState.pop(result)
      : Navigator.pop(this, result);

  void pushReplacementNamed(String routeName,
      {Object? arguments, bool useRootNavigator = false}) =>
      (useRootNavigator ? _appNavigatorState : Navigator.of(this))
          .pushReplacementNamed(routeName, arguments: arguments);

  Future<T?> pushNamed<T>(String routeName,
      {Object? arguments, bool useRootNavigator = false}) {
    return (useRootNavigator ? _appNavigatorState : Navigator.of(this))
        .pushNamed(routeName, arguments: arguments);
  }
}