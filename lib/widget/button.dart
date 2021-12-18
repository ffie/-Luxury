import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoButton extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final double? pressedOpacity;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  const CustomCupertinoButton({
    Key? key,
    this.margin,
    this.padding,
    required this.onTap,
    @required this.child,
    this.pressedOpacity = 0.4,
    this.color,
  })  : assert(pressedOpacity == null ||
            (pressedOpacity >= 0.0 && pressedOpacity <= 1.0)),
        super(key: key);

  bool get enabled => onTap != null;

  @override
  _CustomCupertinoButtonState createState() => _CustomCupertinoButtonState();
}

class _CustomCupertinoButtonState extends State<CustomCupertinoButton>
    with SingleTickerProviderStateMixin {
  static const Duration kFadeOutDuration = Duration(milliseconds: 10);
  static const Duration kFadeInDuration = Duration(milliseconds: 100);
  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  AnimationController? _animationController;
  Animation<double>? _opacityAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _opacityAnimation = _animationController!
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(_opacityTween);

    _setTween();
    super.initState();
  }

  @override
  void didUpdateWidget(CustomCupertinoButton old) {
    _setTween();
    super.didUpdateWidget(old);
  }

  void _setTween() {
    _opacityTween.end = widget.pressedOpacity ?? 1.0;
  }

  @override
  void dispose() {
    _animationController!.dispose();
    _animationController = null;
    super.dispose();
  }

  bool _buttonHeldDown = false;

  void _handleTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _handleTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _handleTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController!.isAnimating) return;
    final bool wasHeldDown = _buttonHeldDown;
    final TickerFuture ticker = _buttonHeldDown
        ? _animationController!.animateTo(1.0, duration: kFadeOutDuration)
        : _animationController!.animateTo(0.0, duration: kFadeInDuration);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) _animate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? EdgeInsets.all(0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapUp: widget.enabled ? _handleTapUp : null,
        onTapDown: widget.enabled ? _handleTapDown : null,
        onTapCancel: widget.enabled ? _handleTapCancel : null,
        onTap: widget.onTap,
        child: FadeTransition(
          opacity: _opacityAnimation!,
          child: Container(
            padding: widget.padding ?? EdgeInsets.all(10),
            color: widget.color ?? null,
            child: Center(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
