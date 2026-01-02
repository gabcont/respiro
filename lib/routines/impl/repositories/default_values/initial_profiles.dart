import 'package:respiro/routines/models/models.dart';

class InitialProfiles {
  static List<Routine> get() {
    return [
      // 1. Respiración Cuadrada
      Routine(
        rawName: 'Respiración Cuadrada',
        rawShortDescription: 'Potencia el enfoque y reduce el estrés agudo.',
        rawLongDescription: 'Técnica utilizada por los Navy SEALs para mantener la calma bajo presión. Visualiza la respiración recorriendo los cuatro lados de un cuadrado. Es excelente para equilibrar el sistema nervioso autónomo y recuperar el control mental rápidamente.',
        difficulty: Difficulty.medium,
        phases: [
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.inhale, stepDuration: 4, rawDescription: 'Inhalar profundamente por la nariz'),
                SequenceStep(type: StepType.hold, stepDuration: 4, rawDescription: 'Retener el aire (Pulmones llenos)'),
                SequenceStep(type: StepType.exhale, stepDuration: 4, rawDescription: 'Exhalar lentamente por la boca'),
                SequenceStep(type: StepType.hold, stepDuration: 4, rawDescription: 'Esperar sin aire (Pulmones vacíos)'),
              ],
            ),
          ),
        ],
      ),

      // 2. Respiración 4-7-8
      Routine(
        rawName: 'Respiración 4-7-8',
        rawShortDescription: 'Tranquilizante natural, ideal para dormir.',
        rawLongDescription: 'Popularizada por el Dr. Andrew Weil, esta técnica actúa como un sedante natural para el sistema nervioso. La retención larga permite una mayor oxigenación y la exhalación lenta le indica al cuerpo que es hora de descansar.',
        difficulty: Difficulty.hard,
        phases: [
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.inhale, stepDuration: 4, rawDescription: 'Inhalar suavemente por la nariz'),
                SequenceStep(type: StepType.hold, stepDuration: 7, rawDescription: 'Retener la respiración relajadamente'),
                SequenceStep(type: StepType.exhale, stepDuration: 8, rawDescription: 'Exhalar con fuerza haciendo sonido (Whoosh)'),
              ],
            ),
          ),
        ],
      ),

      // 3. Respiración Coherente
      Routine(
        rawName: 'Respiración Coherente',
        rawShortDescription: 'Sincroniza corazón y cerebro para balance total.',
        rawLongDescription: 'El objetivo es respirar a un ritmo de 5 a 6 respiraciones por minuto. Esto maximiza la variabilidad de la frecuencia cardíaca (VFC), colocando al cuerpo en un estado óptimo de eficiencia y calma alerta.',
        difficulty: Difficulty.easy,
        phases: [
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.inhale, stepDuration: 6, rawDescription: 'Inhalar suavemente'),
                SequenceStep(type: StepType.exhale, stepDuration: 6, rawDescription: 'Exhalar suavemente'),
              ],
            ),
          ),
        ],
      ),

      // 4. Respiración de Caja Doble (Double Box)
      Routine(
        rawName: 'Respiración de Caja Doble',
        rawShortDescription: 'Profundiza la relajación y la capacidad pulmonar.',
        rawLongDescription: 'Una variación avanzada de la respiración cuadrada. Al duplicar los tiempos, se desafía la capacidad pulmonar y se induce un estado de relajación mucho más profundo. Requiere práctica previa con la respiración cuadrada.',
        difficulty: Difficulty.hard,
        phases: [
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.inhale, stepDuration: 4, rawDescription: 'Inhalar'),
                SequenceStep(type: StepType.hold, stepDuration: 4, rawDescription: 'Retener'),
                SequenceStep(type: StepType.exhale, stepDuration: 4, rawDescription: 'Exhalar'),
                SequenceStep(type: StepType.hold, stepDuration: 4, rawDescription: 'Retener'),
                SequenceStep(type: StepType.inhale, stepDuration: 4, rawDescription: 'Inhalar'),
                SequenceStep(type: StepType.hold, stepDuration: 4, rawDescription: 'Retener'),
                SequenceStep(type: StepType.exhale, stepDuration: 4, rawDescription: 'Exhalar'),
                SequenceStep(type: StepType.hold, stepDuration: 4, rawDescription: 'Retener'),
              ],
            ),
          ),
        ],
      ),

      // 5. Respiración Alternada (Nadi Shodhana)
      Routine(
        rawName: 'Respiración Alternada',
        rawShortDescription: 'Equilibra hemisferios cerebrales y calma la mente.',
        rawLongDescription: 'Técnica yóguica tradicional. Se alterna la respiración entre las fosas nasales izquierda y derecha. Se cree que equilibra los canales de energía del cuerpo, mejora la concentración y reduce la ansiedad.',
        difficulty: Difficulty.medium,
        phases: [
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.inhale, stepDuration: 4, rawDescription: 'Inhalar Izquierda'),
                SequenceStep(type: StepType.hold, stepDuration: 4, rawDescription: 'Retener'),
                SequenceStep(type: StepType.exhale, stepDuration: 4, rawDescription: 'Exhalar Derecha'),
                SequenceStep(type: StepType.inhale, stepDuration: 4, rawDescription: 'Inhalar Derecha'),
                SequenceStep(type: StepType.hold, stepDuration: 4, rawDescription: 'Retener'),
                SequenceStep(type: StepType.exhale, stepDuration: 4, rawDescription: 'Exhalar Izquierda'),
              ],
            ),
          ),
        ],
      ),
    ];
  }
}
