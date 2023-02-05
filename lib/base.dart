import 'package:flutter/cupertino.dart';
import 'package:route_movies_app/shared/widgets/utilis.dart' as utils;

abstract class BaseNavigator {
  void showLoading();

  void hideDialog();

  void showMessage(String message);
}

class BaseViewModel<T extends BaseNavigator> extends ChangeNotifier {
  T? navigator;
}

abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late VM viewModel;

  VM initViewModel();

  @override
  void initState() {
    // TODO:implement initState
    super.initState();
    viewModel = initViewModel();
  }

  @override
  void showLoading() {
    utils.showLoading(context);
  }

  @override
  void hideDialog() {
    utils.hideLoading(context);
  }

  @override
  void showMessage(String message) {
    utils.showMessage(context, message, 'Ok', (context) {
      Navigator.pop(context);
    });
  }
}
