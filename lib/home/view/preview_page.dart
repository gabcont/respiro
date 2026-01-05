import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:respiro/home/cubit/home_cubit.dart';
import 'package:respiro/home/widgets/widgets.dart';
import 'package:respiro/routines/routines.dart';

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
            bool isProfileSelected = state.routines.isNotEmpty && state.routines.elementAtOrNull( state.selectedRoutine) != null;
            return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isProfileSelected 
                    ? ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.2,
                      ),
                      child: Card(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest.withAlpha(230),
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  state.routines[state.selectedRoutine].rawName ?? '',
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  textAlign: TextAlign.center,
                                ),
                                
                                Text(
                                  'Duration: ${Duration(milliseconds: state.routines[state.selectedRoutine].totalDuration).toString().split('.').first.padLeft(8, '0')}',
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  textAlign: TextAlign.center,
                                ),
                                
                                Divider(),

                                ElevatedButton(onPressed: () {}, child: Text('Start Routine'))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ) 
                    : Container(),
                  ],
                );
          },
        ),
      )
    );
  }
}