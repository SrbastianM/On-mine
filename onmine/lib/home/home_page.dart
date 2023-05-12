import 'package:flutter/material.dart';
import 'package:onmine/provider/countdown_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePageView();
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final countdownProvider = Provider.of<CountDownProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CountDown'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.restart_alt_outlined),
          )
        ],
      ),
      body: _CounterLabel(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countdownProvider.StartStopTimer();
        },
        child: Icon(
          countdownProvider.isRunnig
              ? Icons.pause_circle
              : Icons.play_arrow_outlined,
        ),
      ),
    );
  }
}

class _CounterLabel extends StatelessWidget {
  const _CounterLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.timer_outlined,
            color: Colors.blue,
            size: 60.0,
          ),
          Text(
            '00:01',
            style: TextStyle(fontSize: 50.0),
          ),
        ],
      ),
    );
  }
}
