import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class AdoptedPetDialog {
  late ConfettiController _controllerBottomCenter;

  showAdoptionDialog(BuildContext context, String petName) {
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerBottomCenter.play();
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 40),
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      size: 32,
                      color: Color(0xffB0B8CD),
                    ),
                  ),
                ],
              ),
              Text(
                'You have adopted $petName',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          children: [
            SizedBox(
              child: Image.asset(
                'assets/confitti.png',
              ),
              height: 100,
              width: 100,
            ),
            ConfettiWidget(
              confettiController: _controllerBottomCenter,
              blastDirection: -pi / 4,
              emissionFrequency: 0.01,
              numberOfParticles: 200,
              maxBlastForce: 300,
              minBlastForce: 200,
              gravity: 0.3,
            ),
            ConfettiWidget(
              confettiController: _controllerBottomCenter,
              blastDirection: pi / 4,
              emissionFrequency: 0.01,
              numberOfParticles: 200,
              maxBlastForce: 300,
              minBlastForce: 200,
              gravity: 0.3,
            ),
          ],
        );
      },
    );
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }
}
