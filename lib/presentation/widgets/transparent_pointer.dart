import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TransparentPointer extends SingleChildRenderObjectWidget {
  const TransparentPointer({
    required super.child,
    super.key,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderTransparentPointer();
  }
}

class _RenderTransparentPointer extends RenderProxyBox {
  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    return !super.hitTest(result, position: position);
  }
}
