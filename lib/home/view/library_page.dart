import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:respiro/home/cubit/home_cubit.dart';
import 'package:respiro/home/widgets/widgets.dart';

import 'package:respiro/routines/routines.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LibraryPage extends StatefulWidget {

  final void Function(BuildContext, int, Routine)? onProfileSelected;
  final List<ThemeData>? routinesLightThemes;
  final List<ThemeData>? routinesDarkThemes;

  const LibraryPage({
    super.key,
    this.onProfileSelected,
    this.routinesLightThemes,
    this.routinesDarkThemes,
  });

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {

  final _pageController = PageController(
    initialPage: 0,
    viewportFraction: 1,
  );

  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ConstrainedBox(constraints:   BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.1,
              ),
                child:  Text(
                  'My Library', // LCL
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.65,
                ),
                // TODO: Encontrar por qué las cards dan tirones al pasar de elemento.
                child: PageView.builder(
                  padEnds: true,
                  controller: _pageController, 
                  onPageChanged: (index) {
                    setState(() {
                      _activeIndex = index;
                    });
                  },
                  itemCount: state.routines.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return RoutineCard(
                      isActive: index == _activeIndex,
                      lightThemeData: widget.routinesLightThemes != null && widget.routinesLightThemes!.length > index ? widget.routinesLightThemes![index] : Theme.of(context),
                      darkThemeData: widget.routinesDarkThemes != null && widget.routinesDarkThemes!.length > index ? widget.routinesDarkThemes![index] : Theme.of(context),
                      routine: state.routines[index],
                      onTap: () => widget.onProfileSelected?.call(context, index, state.routines[index]),
                    );

                  },
                )
              ), 
              SmoothPageIndicator(
                controller: _pageController,
                count: state.routines.length,
                effect: ScrollingDotsEffect(),
                onDotClicked: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}