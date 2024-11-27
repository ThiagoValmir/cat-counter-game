import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final TextEditingController _controller = TextEditingController();
  Timer? _timer;
  bool _gameOver = false;

  final List<String> _images = [
    "images/cat_1.png",
    "images/cat_2.png",
    "images/cat_3.png",
    "images/cat_4.png",
    "images/cat_5.png",
    "images/cat_6.png",
    "images/cat_7.png",
    "images/cat_8.png",
  ];

  void _startTimer(BuildContext context, int seconds) {
    _timer?.cancel();
    _gameOver = false;

    _timer = Timer(Duration(seconds: seconds), () {
      if (!_gameOver) {
        _gameOver = true;
        _showMessage(context, "Você perdeu! Tempo esgotado!");
      }
    });
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cat Counter Game", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  _startTimer(context, 15);
                  return Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      for (int index = 0; index < state.count; index++)
                        Positioned(
                          left: Random().nextInt(250).toDouble(),
                          top: Random().nextInt(400).toDouble(),
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.asset(
                              _images[Random().nextInt(_images
                                  .length)],
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Digite o número de gatos",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_gameOver) return;
                final userInput = int.tryParse(_controller.text);
                final currentCount = context.read<CounterBloc>().state.count;

                if (userInput == currentCount) {
                  _gameOver = true;
                  _showMessage(context, "Você ganhou!");
                } else {
                  _gameOver = true;
                  _showMessage(context, "Você perdeu! Número errado!");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
              ),
              child: const Text("Verificar", style: TextStyle(color: Colors.white),),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.clear();
          counterBloc.add(CounterRandomPressed());
        },
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.play_arrow, color: Colors.white),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }
}
