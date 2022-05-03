import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

class SafePaddedLoadingOverlay extends StatelessWidget {
  late final bool isLoading;
  late final EdgeInsetsGeometry? padding;
  late final Widget child;
  SafePaddedLoadingOverlay({
    required this.isLoading,
    this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: SafeArea(
        child: Container(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
