import 'dart:async';

import 'package:flutter/material.dart';

import 'waMiddleButton.dart';

class BottomButton extends StatefulWidget {
  final Widget pickUpPage;
  final Widget? rejectPage;

  const BottomButton({super.key, this.rejectPage, required this.pickUpPage});

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> with TickerProviderStateMixin {
  Timer? _incomingCallTimer;
  int _incomingCallDuration = 20;
  late AnimationController _controller;
  bool _visibleAnimation = true;
  double _buttonPosition = 0.0;

  bool isScrollingDown = false;

  void startTimer() {
    _incomingCallTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_incomingCallDuration < 1) {
          _incomingCallTimer?.cancel();
          //    Navigator.pop(context);
        } else {
          _incomingCallDuration = _incomingCallDuration - 1;
        }
      });
    });
  }

  @override
  void initState() {
    startTimer();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _incomingCallTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          alignment: Alignment.bottomCenter,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const SizedBox(
                height: 200,
                width: 100,
              ),
              ArrowStack(
                controller: _controller,
                middleArrowColor: Colors.grey,
              ),
              GestureDetector(
                onPanStart: (details) {
                  setState(() {
                    _visibleAnimation = false;
                  });
                },
                onPanUpdate: (details) {
                  _buttonPosition = details.localPosition.dy.clamp(-200.0, 0.0);

                  // checking if the user is scrolling down
                  if (details.delta.dy > 0) {
                    isScrollingDown = true;
                  } else {
                    isScrollingDown = false;
                  }
                  setState(() {});
                },
                onPanEnd: (details) {
                  setState(() {
                    if (_buttonPosition == -200.0) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => widget.pickUpPage,
                        ),
                      );
                    } else if (_buttonPosition == 0 && isScrollingDown) {
                      if (widget.rejectPage == null) {
                        Navigator.of(context).pop();
                        return;
                      }
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => widget.rejectPage!,
                        ),
                      );
                    } else {
                      _buttonPosition = 0.0;
                      _visibleAnimation = true;
                      isScrollingDown = false;
                    }
                  });
                },
                child: Transform.translate(
                  offset: Offset(0.0, _buttonPosition),
                  child: Stack(
                    children: <Widget>[
                      Visibility(
                        visible: _visibleAnimation == false,
                        child: MiddleButton(
                          buttonColor: isScrollingDown ? Colors.red : Colors.green,
                        ),
                      ),
                      Visibility(
                        visible: _visibleAnimation == true,
                        child: AnimatedMiddleButton(
                          controller: _controller,
                          buttonColor: isScrollingDown ? Colors.red : Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
