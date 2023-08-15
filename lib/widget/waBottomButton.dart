import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'waMiddleButton.dart';

class BottomButton extends StatefulWidget {
  final String nextRoute;
  final Color sideButtonColor;
  final Color middleArrowColor;

  const BottomButton(
      {super.key, required this.nextRoute, required this.sideButtonColor, required this.middleArrowColor});

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> with TickerProviderStateMixin {
  Timer? _incomingCallTimer;
  int _incomingCallDuration = 20;
  late AnimationController _controller;
  bool _visibleAnimation = true;
  double _buttonPosition = 0.0;

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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        RawMaterialButton(
          onPressed: () {
            SystemNavigator.pop();
          },
          elevation: 0,
          fillColor: widget.sideButtonColor,
          constraints: const BoxConstraints.tightFor(
            width: 55,
            height: 55,
          ),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.call_end,
            size: 27,
            color: Colors.white,
          ),
        ),
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
                middleArrowColor: widget.middleArrowColor,
              ),
              GestureDetector(
                onPanStart: (details) {
                  setState(() {
                    _visibleAnimation = false;
                  });
                },
                onPanUpdate: (details) {
                  setState(() {
                    _buttonPosition = details.localPosition.dy.clamp(-200.0, 0.0);
                  });
                  // print(buttonPosition);
                },
                onPanEnd: (details) {
                  setState(() {
                    if (_buttonPosition == -200.0) {
                      Navigator.popAndPushNamed(context, widget.nextRoute);
                    } else {
                      _buttonPosition = 0.0;
                      _visibleAnimation = true;
                    }
                  });
                },
                child: Transform.translate(
                  offset: Offset(0.0, _buttonPosition),
                  child: Stack(
                    children: <Widget>[
                      Visibility(
                        visible: _visibleAnimation == false,
                        child: MiddleButton(),
                      ),
                      Visibility(
                        visible: _visibleAnimation == true,
                        child: AnimatedMiddleButton(
                          controller: _controller,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        RawMaterialButton(
          onPressed: () {
            SystemNavigator.pop();
          },
          elevation: 0,
          fillColor: widget.sideButtonColor,
          constraints: const BoxConstraints.tightFor(
            width: 55,
            height: 55,
          ),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.message,
            size: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
