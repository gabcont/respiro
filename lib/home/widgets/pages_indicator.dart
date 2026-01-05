import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// TODO: agregar tema de pageindicator

class PhasesPageIndicator extends StatefulWidget {
  const PhasesPageIndicator({
    super.key,
    required this.phasesCount,
    required this.previewPageController,
    required this.onDotClicked,
  });

  final int phasesCount;
  final PageController previewPageController;
  final void Function(int) onDotClicked;

  @override
  State<PhasesPageIndicator> createState() => _PhasesPageIndicatorState();
}

class _PhasesPageIndicatorState extends State<PhasesPageIndicator> {
  @override
  Widget build(BuildContext context) {
    if (widget.phasesCount <= 1) {
      return const SizedBox.shrink();
    }

    // SmoothPageIndicator reads from the controller; it may crash if the
    // controller isn't yet attached to a PageView (no clients).
    if (!widget.previewPageController.hasClients) {
      return AnimatedSmoothIndicator(
        activeIndex: 0,
        count: widget.phasesCount,
        effect: ExpandingDotsEffect(),
      );
    }

    return SmoothPageIndicator(
      controller: widget.previewPageController, 
      count: widget.phasesCount,
      effect: ExpandingDotsEffect(),
      onDotClicked: widget.onDotClicked,
    );
  }
}
