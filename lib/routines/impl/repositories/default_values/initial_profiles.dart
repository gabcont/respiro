import 'package:respiro/routines/models/models.dart';

class InitialProfiles {
  static List<Routine> get() {
    return [

      // 0. Prueba 
      Routine(
        rawName: 'Rutina de Debugeo',
        rawShortDescription: 'Potencia el enfoque y reduce el estrés agudo.',
        rawLongDescription: 'Técnica utilizada por los Navy SEALs para mantener la calma bajo presión. Visualiza la respiración recorriendo los cuatro lados de un cuadrado. Es excelente para equilibrar el sistema nervioso autónomo y recuperar el control mental rápidamente.',
        rawBenefitsDescription: 'Mejora la concentración, reduce el estrés y equilibra el sistema nervioso.',
        difficulty: Difficulty.medium,
        phases: [
          // P1
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.inhale, stepDuration: 4000, rawDescription: 'Inhalar profundamente por la nariz'),
                SequenceStep(type: StepType.hold, stepDuration: 4000, rawDescription: 'Retener el aire (Pulmones llenos)'),
                SequenceStep(type: StepType.exhale, stepDuration: 4000, rawDescription: 'Exhalar lentamente por la boca'),
                SequenceStep(type: StepType.hold, stepDuration: 4000, rawDescription: 'Esperar sin aire (Pulmones vacíos)'),
              ],
            ),
          ),

          // P2
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.inhale, stepDuration: 4000, rawDescription: 'Inhala suavemente por la nariz'),
                SequenceStep(type: StepType.meditate, stepDuration: 7000, rawDescription: 'Retén el aire relajando el cuerpo'),
                SequenceStep(type: StepType.exhale, stepDuration: 8000, rawDescription: 'Exhala con fuerza suave (sonido whoosh)'),
              ],
            ),
          ),

          // P3
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.meditate, stepDuration: 7000, rawDescription: 'Retén el aire relajando el cuerpo'),
              ],
            ),
          ),
        ],
      ),

      // 1. Respiración Cuadrada
      Routine(
        rawName: 'Respiración Cuadrada',
        rawShortDescription: 'Potencia el enfoque y reduce el estrés agudo.',
        rawLongDescription: 'Técnica utilizada por los Navy SEALs para mantener la calma bajo presión. Visualiza la respiración recorriendo los cuatro lados de un cuadrado. Es excelente para equilibrar el sistema nervioso autónomo y recuperar el control mental rápidamente.',
        rawBenefitsDescription: 'Mejora la concentración, reduce el estrés y equilibra el sistema nervioso.',
        difficulty: Difficulty.medium,
        phases: [
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.inhale, stepDuration: 4000, rawDescription: 'Inhalar profundamente por la nariz'),
                SequenceStep(type: StepType.hold, stepDuration: 4000, rawDescription: 'Retener el aire (Pulmones llenos)'),
                SequenceStep(type: StepType.exhale, stepDuration: 4000, rawDescription: 'Exhalar lentamente por la boca'),
                SequenceStep(type: StepType.hold, stepDuration: 4000, rawDescription: 'Esperar sin aire (Pulmones vacíos)'),
              ],
            ),
          ),
        ],
      ),

      // 2. Respiración 4-7-8
      Routine(
        rawName: 'Relajación 4-7-8',
        rawShortDescription: 'El tranquilizante natural para el sistema nervioso.',
        rawLongDescription: 'Desarrollada por el Dr. Andrew Weil, esta técnica reduce la ansiedad y ayuda a conciliar el sueño. Al exhalar durante el doble de tiempo que se inhala, se envía una potente señal de relajación al cerebro.',
        rawBenefitsDescription: 'Ideal para insomnio, ataques de ansiedad y control de la ira.',
        difficulty: Difficulty.medium, // Es difícil exhalar 8s al principio
        phases: [
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.inhale, stepDuration: 4000, rawDescription: 'Inhala suavemente por la nariz'),
                SequenceStep(type: StepType.hold, stepDuration: 7000, rawDescription: 'Retén el aire relajando el cuerpo'),
                SequenceStep(type: StepType.exhale, stepDuration: 8000, rawDescription: 'Exhala con fuerza suave (sonido whoosh)'),
              ],
            ),
          ),
        ],
      ),

      // 3. Respiración Coherente
      Routine(
        rawName: 'Respiración Coherente',
        rawShortDescription: 'Equilibrio perfecto entre cuerpo y mente.',
        rawLongDescription: 'Consiste en respirar a un ritmo de 5 a 6 respiraciones por minuto. Sincroniza tu ritmo cardíaco con tu respiración, optimizando la variabilidad de la frecuencia cardíaca (HRV). Es segura para practicar en cualquier momento.',
        rawBenefitsDescription: 'Estabilidad emocional, claridad mental y salud cardiovascular.',
        difficulty: Difficulty.easy,
        phases: [
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.inhale, stepDuration: 6000, rawDescription: 'Inhala lenta y constantemente'),
                SequenceStep(type: StepType.exhale, stepDuration: 6000, rawDescription: 'Exhala al mismo ritmo suave'),
              ],
            ),
          ),
        ],
      ),

      // 4. Suspiro Fisiológico
      Routine(
        rawName: 'Suspiro Fisiológico',
        rawShortDescription: 'Alivio instantáneo del estrés agudo.',
        rawLongDescription: 'Un patrón que imita el mecanismo natural del cuerpo para liberar CO2 rápidamente. Consiste en dos inhalaciones seguidas (una larga y una corta para terminar de llenar los pulmones) y una exhalación extendida.',
        rawBenefitsDescription: 'Elimina el estrés agudo en tiempo real y oxigena la sangre.',
        difficulty: Difficulty.easy,
        phases: [
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.inhale, stepDuration: 3000, rawDescription: 'Inhala por la nariz (70%)'),
                SequenceStep(type: StepType.inhale, stepDuration: 1500, rawDescription: 'Segunda inhalación corta para llenar'),
                SequenceStep(type: StepType.exhale, stepDuration: 6000, rawDescription: 'Suelta todo el aire lentamente'),
              ],
            ),
          ),
        ],
      ),

      // 5. Pausa de Claridad
      Routine(
        rawName: 'Pausa de Claridad',
        rawShortDescription: 'Resetea tu mente en pocos minutos.',
        rawLongDescription: 'Una combinación efectiva: primero equilibramos el oxígeno con respiración triangular y luego dedicamos un momento de silencio para observar las sensaciones del cuerpo antes de volver a la actividad.',
        rawBenefitsDescription: 'Reduce la fatiga mental y mejora la transición entre tareas.',
        difficulty: Difficulty.easy,
        phases: [
          // Fase 1: Respiración Triangular para calmar
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.inhale, stepDuration: 4000, rawDescription: 'Inhala'),
                SequenceStep(type: StepType.hold, stepDuration: 4000, rawDescription: 'Sostén'),
                SequenceStep(type: StepType.exhale, stepDuration: 4000, rawDescription: 'Exhala'),
              ],
            ),
          ),
          // Fase 2: Breve meditación de observación
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.meditate, stepDuration: 180000, rawDescription: 'Cierra los ojos y observa tu estado natural'),
              ],
            ),
          ),
        ],
      ),

      // 6. Respiración Alterna
      Routine(
        rawName: 'Respiración Alterna',
        rawShortDescription: 'Equilibra los hemisferios cerebrales.',
        rawLongDescription: 'Conocida como Nadi Shodhana. Se utiliza para purificar los canales energéticos y calmar la mente. Requiere usar el dedo pulgar y anular para tapar alternativamente las fosas nasales.',
        rawBenefitsDescription: 'Mejora la coordinación, reduce el estrés y aclara la mente antes de trabajar.',
        difficulty: Difficulty.hard, // Requiere coordinación manual
        phases: [
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                // Lado Izquierdo
                SequenceStep(type: StepType.inhale, stepDuration: 4000, rawDescription: 'Tapa derecha, inhala por Izquierda'),
                SequenceStep(type: StepType.hold, stepDuration: 4000, rawDescription: 'Tapa ambas fosas y retén'),
                SequenceStep(type: StepType.exhale, stepDuration: 4000, rawDescription: 'Destapa derecha, exhala por Derecha'),
                // Lado Derecho (Retorno)
                SequenceStep(type: StepType.inhale, stepDuration: 4000, rawDescription: 'Inhala por Derecha'),
                SequenceStep(type: StepType.hold, stepDuration: 4000, rawDescription: 'Tapa ambas fosas y retén'),
                SequenceStep(type: StepType.exhale, stepDuration: 4000, rawDescription: 'Destapa izquierda, exhala por Izquierda'),
              ],
            ),
          ),
        ],
      ),

      // 7. Calma 1:2
      Routine(
        rawName: 'Calma 1:2',
        rawShortDescription: 'Frena el ritmo cardíaco inmediatamente.',
        rawLongDescription: 'Esta proporción matemática activa directamente el nervio vago y el sistema parasimpático. Es la herramienta más simple y efectiva para detener un ataque de pánico o ansiedad leve.',
        rawBenefitsDescription: 'Reducción inmediata de pulsaciones y presión arterial.',
        difficulty: Difficulty.easy,
        phases: [
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.inhale, stepDuration: 4000, rawDescription: 'Inhala suavemente'),
                SequenceStep(type: StepType.exhale, stepDuration: 8000, rawDescription: 'Exhala muy lento, como por un pitillo'),
              ],
            ),
          ),
        ],
      ),

      // 8. Triangulo de Vacío
      Routine(
        rawName: 'Triángulo de Vacío',
        rawShortDescription: 'Encuentra el silencio interior.',
        rawLongDescription: 'Una variación geométrica que elimina la retención con aire y enfatiza la pausa tras exhalar. Es excelente para detener el diálogo interno obsesivo.',
        rawBenefitsDescription: 'Silencia la mente y mejora la tolerancia al CO2.',
        difficulty: Difficulty.medium,
        phases: [
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.inhale, stepDuration: 4000, rawDescription: 'Inhala'),
                SequenceStep(type: StepType.exhale, stepDuration: 4000, rawDescription: 'Exhala'),
                SequenceStep(type: StepType.hold, stepDuration: 4000, rawDescription: 'Pausa en vacío (Sin aire)'),
              ],
            ),
          ),
        ],
      ),

      // 9. Energía profunda
      Routine(
        rawName: 'Energía Profunda',
        rawShortDescription: 'Carga tu cuerpo de oxígeno al despertar.',
        rawLongDescription: 'Inspirada en técnicas tibetanas y modernas de activación. Consiste en una fase de respiración rítmica rápida para alcalinizar la sangre, seguida de una retención larga para aprovechar el oxígeno.',
        rawBenefitsDescription: 'Energía explosiva, refuerzo inmune y resistencia al frío.',
        difficulty: Difficulty.hard,
        phases: [
          // FASE 1: La Carga (Se repite muchas veces, ej: 30 rondas en tu lógica de ejecución)
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.inhale, stepDuration: 2000, rawDescription: 'Inhala profundo (100%)'),
                SequenceStep(type: StepType.exhale, stepDuration: 1500, rawDescription: 'Suelta relajado (50%)'),
              ],
            ),
          ),
          // FASE 2: La Retención (Se hace 1 sola vez al final de la carga)
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.exhale, stepDuration: 2000, rawDescription: 'Suelta todo el aire'),
                SequenceStep(type: StepType.hold, stepDuration: 60000, rawDescription: 'Aguanta sin aire lo que puedas'),
                SequenceStep(type: StepType.inhale, stepDuration: 3000, rawDescription: 'Inhala profundo y sostén 15s (Recuperación)'),
              ],
            ),
          ),
        ],
      ),

      // 10. Respiración del abejorro
      Routine( 
        rawName: 'Respiración del Abejorro',
        rawShortDescription: 'Vibración sonora para calmar la ira.',
        rawLongDescription: 'Bhramari Pranayama. Al exhalar, se produce un zumbido constante (como una abeja "Mmmmm") con la garganta. La vibración estimula el nervio vago y bloquea estímulos externos.',
        rawBenefitsDescription: 'Elimina la frustración, la ira y mejora la voz.',
        difficulty: Difficulty.easy,
        phases: [
          Phase(
            sequence: EmbeddedSequence(
              steps: [
                SequenceStep(type: StepType.inhale, stepDuration: 5000, rawDescription: 'Inhala profundo'),
                SequenceStep(type: StepType.hold, stepDuration: 2000, rawDescription: 'Tapa tus oídos con los dedos'),
                SequenceStep(type: StepType.exhale, stepDuration: 8000, rawDescription: 'Exhala haciendo el sonido "Mmmmm"'),
              ],
            ),
          ),
        ],
      )
    ];
  }
}
