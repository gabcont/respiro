import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:respiro/home/widgets/widgets.dart';
import 'package:respiro/routines/routines.dart';
import 'package:respiro/theme/cubit/theme_cubit.dart';


class RoutineCard extends StatefulWidget {

  final Routine routine;
  final VoidCallback onTap;
  final double maxWidth;
  final ThemeData lightThemeData;
  final ThemeData darkThemeData;
  final bool isActive;

  const RoutineCard({
    super.key,
    required this.routine,
    required this.onTap,
    this.maxWidth = 600.0,
    required this.darkThemeData,
    required this.lightThemeData,
    required this.isActive,
  });

  @override
  State<RoutineCard> createState() => _RoutineCardState();
}

class _RoutineCardState extends State<RoutineCard> with TickerProviderStateMixin {

  late final TabController _tabController = TabController(length: 3, vsync: this);
  late final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    final themeData = context.select((ThemeCubit cubit) => cubit.state.themeMode == ThemeMode.light) ? widget.lightThemeData : widget.darkThemeData;
    return Theme(
        data: themeData,
        child: RepaintBoundary(
          child: TickerMode(
            enabled: widget.isActive,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: widget.maxWidth,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    color: themeData.colorScheme.surfaceContainerHighest.withAlpha(200),
                    elevation: 0,
                    child: InkWell(
                      onTap: widget.onTap,
                      borderRadius: BorderRadius.circular(12),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return _buildExpandedLayout(context);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
  }

  Widget _buildExpandedLayout(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Flexible(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                widget.routine.rawName ?? '',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Divider(),
          Expanded(
            flex: 10,
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                PreviewTab(routine: widget.routine),
                DescriptionTab(routine: widget.routine),
                BenefitsTab(routine: widget.routine),
              ]
            ),
          ),

          Divider(),
          TabBar(
            dividerHeight: 0,
            tabAlignment: TabAlignment.fill,
            controller: _tabController,
            onTap: (value) {
              _pageController.animateToPage(
                value,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOutCubicEmphasized,
              );
            },
            tabs:[
              Tab(child: Icon(Icons.self_improvement, size: 24.0,),),
              Tab(child: Icon(Icons.menu_book, size: 24.0,),),
              Tab(child: Icon(Icons.favorite_rounded, size: 24.0,),),
            ],
          )
        ],
      ),
    );
  }
}

class BenefitsTab extends StatelessWidget {
  const BenefitsTab({
    super.key,
    required this.routine,
  });

  final Routine routine;

  @override
  Widget build(BuildContext context) {
    final text = routine.rawBenefitsDescription?.trim();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Text(
          (text == null || text.isEmpty) ? 'No benefits description.' : text,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class DescriptionTab extends StatelessWidget {
  const DescriptionTab({
    super.key,
    required this.routine,
  });

  final Routine routine;

  @override
  Widget build(BuildContext context) {
    final text = (routine.rawLongDescription ?? routine.rawShortDescription)?.trim();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Text(
          (text == null || text.isEmpty) ? 'No description.' : text,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class PreviewTab extends StatelessWidget {
  const PreviewTab({
    super.key,
    required this.routine,
  });

  final Routine routine;

  @override
  Widget build(BuildContext context) {

    final shortDescription = routine.rawShortDescription?.trim();

    Widget previewWidget;
    previewWidget = RoutinePreviewCard(
      routine: routine, 
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (shortDescription != null && shortDescription.isNotEmpty)
                Text(
                  shortDescription,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              if (shortDescription != null && shortDescription.isNotEmpty)
                const SizedBox(height: 16),
              Divider(),
              //TODO: No activar animación por defecto, usar algún trigger
              previewWidget,
            ],
          ),
        ),
      ),
    );
  }
}