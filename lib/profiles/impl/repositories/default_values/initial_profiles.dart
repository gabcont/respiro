import 'package:respiro/profiles/domain/domain.dart';

class InitialProfiles {
  static List<BreathingProfile> get() {
    return [
    // 1. Respiración Cuadrada
    BreathingProfile(
      title: 'Respiración Cuadrada',
      shortDescription: 'Potencia el enfoque y reduce el estrés agudo.',
      longDescription: 'Técnica utilizada por los Navy SEALs para mantener la calma bajo presión. Visualiza la respiración recorriendo los cuatro lados de un cuadrado. Es excelente para equilibrar el sistema nervioso autónomo y recuperar el control mental rápidamente.',
      steps: [
        BreathingStep(type: StepType.inhale, duration: 4, description: 'Inhalar profundamente por la nariz'),
        BreathingStep(type: StepType.hold, duration: 4, description: 'Retener el aire (Pulmones llenos)'),
        BreathingStep(type: StepType.exhale, duration: 4, description: 'Exhalar lentamente por la boca'),
        BreathingStep(type: StepType.hold, duration: 4, description: 'Esperar sin aire (Pulmones vacíos)'),
      ],
    ),

    // 2. Respiración 4-7-8
    BreathingProfile(
      title: 'Respiración 4-7-8',
      shortDescription: 'Tranquilizante natural, ideal para dormir.',
      longDescription: 'Popularizada por el Dr. Andrew Weil, esta técnica actúa como un sedante natural para el sistema nervioso. La retención larga permite una mayor oxigenación y la exhalación lenta le indica al cuerpo que es hora de descansar.',
      steps: [
        BreathingStep(type: StepType.inhale, duration: 4, description: 'Inhalar suavemente por la nariz'),
        BreathingStep(type: StepType.hold, duration: 7, description: 'Retener la respiración relajadamente'),
        BreathingStep(type: StepType.exhale, duration: 8, description: 'Exhalar con fuerza haciendo sonido (Whoosh)'),
      ],
    ),

    // 3. Respiración Coherente
    BreathingProfile(
      title: 'Respiración Coherente',
      shortDescription: 'Sincroniza corazón y cerebro para balance total.',
      longDescription: 'El objetivo es respirar a un ritmo de 5 a 6 respiraciones por minuto. Esto maximiza la variabilidad de la frecuencia cardíaca (VFC), colocando al cuerpo en un estado óptimo de eficiencia y calma alerta.',
      steps: [
        BreathingStep(type: StepType.inhale, duration: 6, description: 'Inhalar suave y continuo'),
        BreathingStep(type: StepType.exhale, duration: 6, description: 'Exhalar suave y continuo'),
      ],
    ),

    // 4. Sama Vritti (Respiración Equitativa)
    BreathingProfile(
      title: 'Sama Vritti',
      shortDescription: 'Calma la mente igualando la entrada y salida.',
      longDescription: 'Una técnica fundamental del Yoga. Al igualar la duración de la inhalación y la exhalación, se crea un ritmo estable que reduce el ruido mental y mejora la concentración suave.',
      steps: [
        BreathingStep(type: StepType.inhale, duration: 4, description: 'Inhalar contando hasta 4'),
        BreathingStep(type: StepType.exhale, duration: 4, description: 'Exhalar contando hasta 4'),
      ],
    ),

    // 5. Suspiro Fisiológico
    BreathingProfile(
      title: 'Suspiro Fisiológico',
      shortDescription: 'Elimina el pánico o ansiedad al instante.',
      longDescription: 'Respaldada por la neurociencia, consiste en una doble inhalación que abre los alvéolos pulmonares colapsados, seguida de una exhalación larga para deshacerse del exceso de dióxido de carbono.',
      steps: [
        BreathingStep(type: StepType.inhale, duration: 3, description: 'Inhalar llenando la mayor parte'),
        BreathingStep(type: StepType.inhale, duration: 1, description: 'Segunda inhalación corta para llenar al tope'),
        BreathingStep(type: StepType.exhale, duration: 6, description: 'Exhalar muy lento por la boca'),
      ],
    ),

    // 6. Respiración Diafragmática (Abdominal)
    BreathingProfile(
      title: 'Respiración Diafragmática',
      shortDescription: 'Fundamento de la relajación profunda.',
      longDescription: 'Ideal para principiantes y control general. Enfócate en que sea tu abdomen el que se expanda, no tu pecho. Esto baja el diafragma y permite un intercambio de oxígeno completo, reduciendo la frecuencia cardíaca al instante.',
      steps: [
        BreathingStep(type: StepType.inhale, duration: 5, description: 'Inhalar expandiendo el abdomen'),
        BreathingStep(type: StepType.hold, duration: 2, description: 'Pausa breve y relajada'),
        BreathingStep(type: StepType.exhale, duration: 5, description: 'Exhalar contrayendo el abdomen'),
      ],
    ),

    // 7. Calma 1:2 (Anti-Pánico)
    BreathingProfile(
      title: 'Calma 1:2',
      shortDescription: 'Freno de emergencia para crisis de pánico.',
      longDescription: 'Cuando exhalamos el doble de tiempo del que inhalamos, enviamos una señal directa al nervio vago para ralentizar el corazón. Es la técnica más efectiva para detener un ataque de ansiedad o hiperventilación.',
      steps: [
        BreathingStep(type: StepType.inhale, duration: 4, description: 'Inhalar rápido por la nariz'),
        BreathingStep(type: StepType.exhale, duration: 8, description: 'Exhalar muy lento (como por un pitillo)'),
      ],
    ),

    // 8. Respiración 5-2-7 (Alivio de Estrés)
    BreathingProfile(
      title: 'Técnica 5-2-7',
      shortDescription: 'Intermedio ideal para bajar revoluciones.',
      longDescription: 'Una variación más suave que la 4-7-8, perfecta si sientes que te falta el aire con retenciones largas. Ayuda a transicionar de un estado de alerta (trabajo/estudio) a uno de descanso.',
      steps: [
        BreathingStep(type: StepType.inhale, duration: 5, description: 'Inhalar suavemente'),
        BreathingStep(type: StepType.hold, duration: 2, description: 'Retener un momento'),
        BreathingStep(type: StepType.exhale, duration: 7, description: 'Exhalar soltando todo el aire'),
      ],
    ),

    // 9. Respiración de Labios Fruncidos
    BreathingProfile(
      title: 'Labios Fruncidos',
      shortDescription: 'Recupera el aliento y control físico.',
      longDescription: 'Utilizada médicamente para pacientes con dificultades respiratorias. Fruncir los labios crea una resistencia que mantiene las vías respiratorias abiertas más tiempo, ideal cuando sientes opresión en el pecho por nervios.',
      steps: [
        BreathingStep(type: StepType.inhale, duration: 2, description: 'Inhalar por la nariz'),
        BreathingStep(type: StepType.exhale, duration: 4, description: 'Exhalar con labios fruncidos (soplando vela)'),
      ],
    ),

    // 10. Visualización de Globo (Para Dormir)
    BreathingProfile(
      title: 'Visualización de Globo',
      shortDescription: 'Meditativa, para desconectar la mente.',
      longDescription: 'Una técnica lenta diseñada para el insomnio. Visualiza que eres un globo que se infla lentamente y luego se desinfla sin esfuerzo alguno, dejando que el cuerpo se hunda en la cama.',
      steps: [
        BreathingStep(type: StepType.inhale, duration: 6, description: 'Inflarse lentamente'),
        BreathingStep(type: StepType.hold, duration: 2, description: 'Mantener flotando'),
        BreathingStep(type: StepType.exhale, duration: 9, description: 'Desinflarse totalmente y relajarse'),
      ],
    ),
  ];
  }
}