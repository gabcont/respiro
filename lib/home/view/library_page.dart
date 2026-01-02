import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

import 'package:respiro/home/cubit/home_cubit.dart';
import 'package:respiro/home/widgets/widgets.dart';

import 'package:respiro/routines/routines.dart';

class LibraryPage extends StatefulWidget {

  final void Function(BuildContext, int, Routine)? onProfileSelected;

  const LibraryPage({
    super.key,
    this.onProfileSelected,
  });

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {

  final _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.8,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Building Library Page');
    return SafeArea(
      child:  BlocBuilder<HomeCubit, HomeState>(

        builder: (context, state) {
          if(_pageController.hasClients) _pageController.jumpToPage(state.selectedProfile);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ConstrainedBox(constraints:   BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.1,
              ),
                child:  Text(
                  'My Library',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.6,
                ),
                child: PageView.builder(
                  padEnds: true,
                  controller: _pageController, 
                  itemCount: state.breathingProfiles.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return BreathingProfileCard(
                      profile: state.breathingProfiles[index],
                      onTap: () => widget.onProfileSelected?.call(context, index, state.breathingProfiles[index]),
                    );

                  },
                )
              ), 
            ],
          );
        },
      ),
    );
  }
}