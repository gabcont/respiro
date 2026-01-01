import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:respiro/home/cubit/home_cubit.dart';

import 'package:respiro/home/widgets/widgets.dart';
import 'package:respiro/l10n/generated/app_localizations.dart';

import 'package:respiro/profiles/profiles.dart';

class HomeBody extends StatelessWidget {
  final BreathingProfile selectedProfile;
  const HomeBody({
    super.key,
    required this.selectedProfile,
  });

  void _onPlayPressed(BuildContext context) {
    context.read<HomeCubit>().onBreathingSessionStarted(selectedProfile, 10);
  }

  void _onPreferencesPressed(BuildContext context) {
    //context.read<HomeCubit>().onPreferencesEntered();
  }

  @override
  Widget build(BuildContext context) {
    final lcl = AppLocalizations.of(context)!;
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isPortrait = constraints.maxHeight >= constraints.maxWidth;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            title: Text(lcl.appName), 
            actions: [
              HomeBarActions(
                onPreferencesPressed: () => _onPreferencesPressed(context)
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfilePreviewCard(
                  profile: selectedProfile, 
                  isPortrait: isPortrait,
                  playButton: PlayButton(
                    onPressed: () => _onPlayPressed(context),
                  ),
                ),
              ],
            )
          ),
        );
      }
    );
  }
}
