import 'dart:math';

import 'package:flutter/material.dart';

class SkillMatrixCol extends StatelessWidget {
  const SkillMatrixCol({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: constraints.maxHeight * 0.1,
                  );
                },
                itemCount: 5,
                itemBuilder: (ctx, i) {
                  int randomNum = Random().nextInt(98) + 1;

                  return SkillLevelIdentifierWidget(
                    leftHeader: "Skill $i",
                    rightValue: "$randomNum",
                    primaryValue: randomNum.toDouble() + 10,
                    secondaryValue: randomNum.toDouble(),
                  );
                }));
      },
    );
  }
}

class SkillLevelIdentifierWidget extends StatelessWidget {
  const SkillLevelIdentifierWidget({
    super.key,
    required this.primaryValue,
    required this.secondaryValue,
    required this.leftHeader,
    required this.rightValue,
  });

  final double primaryValue;
  final double secondaryValue;
  final String leftHeader;
  final String rightValue;

  @override
  Widget build(BuildContext context) {
    final normalizedPrimaryValue = normalizeValue(primaryValue);
    final normalizedSecondaryValue = normalizeValue(secondaryValue);
    return Row(
      children: [
        const SizedBox(
          width: 30,
        ),
        Text(leftHeader),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, iconstraints) {
              return Stack(
                children: [
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: iconstraints.maxWidth * normalizedPrimaryValue,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )),
                  ),
                  Container(
                    height: 20,
                    width: iconstraints.maxWidth * normalizedSecondaryValue,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(rightValue),
      ],
    );
  }
}

double normalizeValue(double value) {
  int numberOfDigits = value.toInt().toString().length;
  return value /
      (numberOfDigits == 1
          ? 10
          : numberOfDigits == 2
              ? 100
              : 1000);
}
