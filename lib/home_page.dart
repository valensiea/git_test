import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Icon(Icons.security),
                        Text("PIN LOGIN"),
                      ],
                    )
                  ],
                ),
                Spacer(),
                Text("_______"),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text("1"),
                                Text("one"),
                              ],
                            ),
                            Column(
                              children: [
                                Text("2"),
                                Text("two"),
                              ],
                            ),
                            Column(
                              children: [
                                Text("3"),
                                Text("three"),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [Text("4"), Text("four")],
                            ),
                            Column(
                              children: [
                                Text("5"),
                                Text("five"),
                              ],
                            ),
                            Column(
                              children: [
                                Text("6"),
                                Text("six"),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text("7"),
                                Text("seven"),
                              ],
                            ),
                            Column(
                              children: [
                                Text("8"),
                                Text("eight"),
                              ],
                            ),
                            Column(
                              children: [
                                Text("9"),
                                Text("nine"),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.close),
                            Column(
                              children: [
                                Text("0"),
                                Text("zero"),
                              ],
                            ),
                            Icon(Icons.backspace),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                // Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
