import 'package:flutter/material.dart';
import 'package:respiro/home/widgets/widgets.dart';
import 'package:respiro/routines/routines.dart';

// Container for the routine preview with page indicator.
class RoutinePreviewCard extends StatefulWidget {
  
  final Routine? routine;

  const RoutinePreviewCard({
    super.key,
    required this.routine,
  });

  @override
  State<RoutinePreviewCard> createState() => _RoutinePreviewCardState();
}

class _RoutinePreviewCardState extends State<RoutinePreviewCard> {

  final PageController _previewPageController = PageController(
    initialPage: 0,
  );
  bool showPreview = false;

  void _onPageIndicatorClicked(int index) {
    _previewPageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _previewPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routine = widget.routine;
    if (routine == null) {
      return const SizedBox.shrink();
    }

    return AspectRatio(
      aspectRatio: 0.75,
      child: Column(
        children: [
          Expanded(
            child: showPreview 
            ?  RoutinePreview(
              routine: routine,
                previewPageController: _previewPageController,
            ) 
            : Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showPreview = true;
                  });

                  // Rebuild after the PageView attaches to the controller.
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!mounted) return;
                    setState(() {});
                  });
                },
                child: Text('Show Preview'),
              ),
            ),
          ),
          SizedBox(height: 16),

          // Phases Indicator
          if(showPreview) PhasesPageIndicator(
            phasesCount: routine.phases.length,
            previewPageController: _previewPageController,
            onDotClicked: _onPageIndicatorClicked,
          ), 
        ],
      )
    );
  }
}

class RoutinePreview extends StatelessWidget {
  const RoutinePreview({
    super.key,
    required this.routine,
    required this.previewPageController,
  });

  final PageController previewPageController;
  final Routine routine;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: previewPageController,
      itemCount: routine.phases.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return PhasePreview(phase: routine.phases[index]);
      },
    );
  }
}
