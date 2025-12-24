import 'package:flutter/material.dart';
import 'package:respiro/profiles/profiles.dart';

class ProfileCard extends StatelessWidget {

  final BreathingProfile profile;
  final VoidCallback onPressed;

  const ProfileCard({
    super.key,
    required this.profile,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(  context).colorScheme.primaryContainer,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListTile(
        leading: const Icon(Icons.air, size: 50,),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(profile.title, style: Theme.of(context).textTheme.titleLarge),
            Row(
              children: profile.steps.map((step) => Text(
                "${step.duration.toInt()}  ",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: switch (step.type) {
                    StepType.inhale => Colors.lightBlueAccent,
                    StepType.hold => Colors.grey,
                    StepType.exhale => Colors.redAccent,
                  },
                ),
              )).toList(),
            )
          ],
        ),
        subtitle: Text(profile.shortDescription, style: Theme.of(context).textTheme.bodyLarge),
        trailing: const Icon(Icons.chevron_right),
        onTap: onPressed,
      ),
    );
  }
}