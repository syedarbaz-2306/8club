import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hotspot/provider/onboarding_pvdr.dart';
import 'package:hotspot/styles/app_styles.dart';
import 'package:hotspot/widgets/common/gradient_button.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    // Grayscale matrix for ColorFiltered
    const doubles = <double>[
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ];
    return Consumer<OnboardingPvdr>(
      builder: (context, value, _) {
        return LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: EdgeInsets.all($styles.insets.sm),
                child: Column(
                  spacing: $styles.insets.sm,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "0${value.currentStep.toString()}",
                      style: $styles.fonts.subtitle1Regular.copyWith(
                        color: $styles.colors.text5,
                      ),
                    ),
                    Text(
                      "What kind of hotspots do you want to host?",
                      style: $styles.fonts.h2Bold,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.25,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: value.expList.length,
                        itemBuilder: (context, index) {
                          final expItem = value.expList[index];
                          final isSelected =
                              value.selectedExpList.contains(expItem);
                          Widget imageWidget = Image.network(
                            expItem.imageUrl,
                            width: MediaQuery.of(context).size.width * 0.23,
                            height: MediaQuery.of(context).size.width * 0.23,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              width: MediaQuery.of(context).size.width * 0.23,
                              height: MediaQuery.of(context).size.width * 0.23,
                              color: $styles.colors.surfaceBlack1,
                              alignment: Alignment.center,
                              child: Text(expItem.name,
                                  style: $styles.fonts.h3Regular),
                            ),
                          );

                          if (!isSelected) {
                            imageWidget = ColorFiltered(
                              colorFilter: const ColorFilter.matrix(doubles),
                              child: imageWidget,
                            );
                          }

                          return GestureDetector(
                            onTap: () {
                              value.updateSelectedExpList(expItem);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: $styles.insets.xs,
                              ),
                              child: Transform.rotate(
                                angle: (index % 2 == 0)
                                    ? -3 * (math.pi / 180)
                                    : 3 * (math.pi / 180),
                                child: imageWidget,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    TextField(
                      maxLines: null,
                      minLines: 5,
                      keyboardType: TextInputType.multiline,
                      maxLength: 250,
                      style: $styles.fonts.h3Regular.copyWith(
                        color: $styles.colors.text1,
                      ),
                      onChanged: (text) {
                        if (text.length <= 3) {
                          return;
                        }
                        value.setExpDesc(text);
                      },
                      decoration: InputDecoration(
                        hintText: "/ Describe your perfect hotspot",
                        hintStyle: $styles.fonts.h3Regular.copyWith(
                          color: $styles.colors.text5,
                        ),
                        filled: true,
                        fillColor: $styles.colors.surfaceWhite1,
                        contentPadding: EdgeInsets.all($styles.insets.sm),

                        // Hide default border when filled, making it cleaner
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular($styles.insets.xs),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular($styles.insets.xs),
                          borderSide: BorderSide(
                            color: $styles.colors.primaryAccent,
                            width: 2.0,
                          ),
                        ),
                        counter: const SizedBox.shrink(),
                      ),
                    ),
                    GradientButton(
                      label: "Next",
                      icon: LucideIcons.arrowBigRightDash,
                      isEnabled: value.selectedExpList.isNotEmpty &&
                          value.expDesc.isNotEmpty,
                      onPressed: () {
                        value.nextStep();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
