import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:respiro/home/cubit/home_cubit.dart';
import 'package:respiro/home/widgets/widgets.dart';
import 'package:respiro/profiles/domain/models/profile_model.dart';

class PreviewPage extends StatelessWidget {

  const PreviewPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            bool isProfileSelected = state.breathingProfiles.isNotEmpty && state.breathingProfiles.elementAtOrNull( state.selectedProfile) != null;
            return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (true == false) ? ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.2,
                      ),
                      child: BreathingProfileCard(
                        profile: state.breathingProfiles[state.selectedProfile],
                        onTap: () {},
                      ),
                    ) : Container(),
                  ],
                );
          },
        ),
      )
    );
  }
}