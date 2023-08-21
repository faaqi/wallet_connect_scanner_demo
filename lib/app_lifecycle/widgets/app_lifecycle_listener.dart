import 'package:flutter/material.dart';

class AppLifecycleListener extends StatefulWidget {
  const AppLifecycleListener({
    required this.child,
    super.key,
    this.onResumedState,
    this.onInactiveState,
    this.onPausedState,
    this.onDetachedState,
  });

  final Widget child;
  final VoidCallback? onResumedState;
  final VoidCallback? onInactiveState;
  final VoidCallback? onPausedState;
  final VoidCallback? onDetachedState;

  @override
  // ignore: no_logic_in_create_state
  AppLifecycleListenerState createState() => AppLifecycleListenerState(
        onResumedState: onResumedState,
        onInactiveState: onInactiveState,
        onPausedState: onPausedState,
        onDetachedState: onDetachedState,
      );
}

class AppLifecycleListenerState extends State<AppLifecycleListener>
    with WidgetsBindingObserver {
  AppLifecycleListenerState({
    required this.onResumedState,
    required this.onInactiveState,
    required this.onPausedState,
    required this.onDetachedState,
  });

  final VoidCallback? onResumedState;
  final VoidCallback? onInactiveState;
  final VoidCallback? onPausedState;
  final VoidCallback? onDetachedState;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResumedState?.call();
      case AppLifecycleState.inactive:
        onInactiveState?.call();
      case AppLifecycleState.paused:
        onPausedState?.call();
      case AppLifecycleState.detached:
        onDetachedState?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }
}
