import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

final WrapAnimation notificationAnimation=(controller,child)=>NormalAnimation(
  reverse: true,
  controller: controller,
  child: child,
);

final WrapAnimation textAnimation=(controller,child)=>NormalAnimation(
  controller: controller,
  child: child,
);
final WrapAnimation loadingAnimation=(controller,child)=>FadeAnimation(
  controller: controller,
  child: child,
);

final WrapAnimation attachedAnimation=(controller,child)=>FadeAnimation(
  controller: controller,
  child: child,
);

class NormalAnimation extends StatefulWidget {
  final Widget child;
  final bool reverse;
  final AnimationController controller;

  const NormalAnimation(
      {Key key, this.child, this.reverse = false, this.controller})
      : assert(child != null),
        super(key: key);

  @override
  NormalAnimationState createState() => NormalAnimationState();
}

class NormalAnimationState extends State<NormalAnimation>
    with SingleTickerProviderStateMixin {
  static final Tween<Offset> reverseTweenOffset = Tween<Offset>(
    begin: Offset(0, -40),
    end: Offset(0, 0),
  );
  static final Tween<Offset> tweenOffset = Tween<Offset>(
    begin: Offset(0, 40),
    end: Offset(0, 0),
  );
  static final Tween<double> tweenOpacity = Tween<double>(begin: 0, end: 1);
  Animation<double> animation;

  Animation<Offset> animationOffset;
  Animation<double> animationOpacity;

  @override
  void initState() {

    animation = CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);

    animationOffset =
        (widget.reverse ? reverseTweenOffset : tweenOffset).animate(animation);
    animationOpacity = tweenOpacity.animate(animation);

    widget.controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (_, child) {
        return Transform.translate(
          offset: animationOffset.value,
          child: Opacity(
            opacity: animationOpacity.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

//淡出淡入动画
class FadeAnimation extends StatefulWidget {
  final Widget child;
  final AnimationController controller;

  const FadeAnimation({Key key, this.child, this.controller})
      : super(key: key);

  @override
  FadeAnimationState createState() => FadeAnimationState();
}

class FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  static final Tween<double> tweenOpacity = Tween<double>(begin: 0, end: 1);
  Animation<double> animation;
  Animation<double> animationOpacity;

  @override
  void initState() {
    animation = CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);

    animationOpacity = tweenOpacity.animate(animation);

    widget.controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationOpacity,
      child: widget.child,
    );
  }
}

