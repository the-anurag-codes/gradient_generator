import 'package:flutter/material.dart';
import 'package:gradient_generator/gradient_generator.dart';
import 'package:gradient_generator/src/widgets/gradient_animation.dart';
import 'package:gradient_generator/src/widgets/gradient_pulse_button.dart';

void main() => runApp(const GradientDemoApp());

class GradientDemoApp extends StatelessWidget {
  const GradientDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gradient Generator',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Gradient Generator Example')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _sectionTitle('1. Preset Gradient'),
              GradientContainer(
                gradient: GradientPresets.sunset,
                height: 120,
                borderRadius: BorderRadius.circular(12),
                child: const Center(
                  child: Text('Sunset Preset',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              const SizedBox(height: 20),
              _sectionTitle('2. Custom Gradient with Angle'),
              GradientContainer(
                gradient: GradientX.linear(
                  colors: [Colors.purple, Colors.blue],
                  angle: 135,
                ),
                height: 120,
                borderRadius: BorderRadius.circular(12),
                child: const Center(
                  child: Text('Linear 135°',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              const SizedBox(height: 20),
              _sectionTitle('3. Gradient From Mood'),
              GradientContainer(
                gradient: GradientXExtended.fromMood(
                  baseColor: Colors.orange,
                  mood: GradientMood.neon,
                ),
                height: 120,
                borderRadius: BorderRadius.circular(12),
                child: const Center(
                  child: Text('Mood: Neon',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              const SizedBox(height: 20),
              _sectionTitle('4. Random Gradient'),
              GradientContainer(
                gradient: GradientXRandom.generate(),
                height: 120,
                borderRadius: BorderRadius.circular(12),
                child: const Center(
                  child: Text('Random',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
              const SizedBox(height: 20),
              _sectionTitle('5. Animated Gradient'),
              const SizedBox(
                height: 150,
                child: GradientAnimation(
                  type: GradientType.linear,
                  angleStart: 0,
                  angleEnd: 360,
                  child: Center(
                    child: Text('Animated Colors & Angle',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _sectionTitle('6. Pulse Button'),
              GradientPulseButton(
                onPressed: () {},
                colors: const [Colors.pink, Colors.deepPurple],
                child: const Text('Pulse Me!',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      );
}
