import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_pick/features/random/random_number/presentation/pages/random_number_state.dart';
import '../../../presentation/widgets/message_display.dart';

/// Widget or Page that displays the random number pick
class RandomNumberPage extends StatefulWidget {
  RandomNumberPage({super.key});

  @override
  State<RandomNumberPage> createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> {
  late RandomNumberState state;

  @override
  void initState() {
    state = RandomNumberState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ValueListenableBuilder<List<String>>(
              valueListenable: state.stringslistenable,
              builder: (context, value, child) {
                if (value.isEmpty) return CircularProgressIndicator();
                return Stack(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                        onPressed: null,
                        height: 50,
                        color: Colors.redAccent,
                        textColor: Colors.black,
                        child: Text('oi amigo'),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Column(
                          children: [
                            const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ],
                        )),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
