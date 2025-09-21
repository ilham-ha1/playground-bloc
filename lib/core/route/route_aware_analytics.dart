import 'package:flutter/widgets.dart';

// A Navigator observer that notifies RouteAwares of changes to state of their Route
final routeObserver = RouteObserver<ModalRoute>();

mixin RouteAwareAnalytics<T extends StatefulWidget> on State<T>
    implements RouteAware {
  String get route;

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPop() {}

  @override
  void didPopNext() {
    // Called when the top route has been popped off,
    // and the current route shows up.
  }

  @override
  void didPush() {
    // Called when the current route has been pushed.
  }

  @override
  void didPushNext() {}
}
