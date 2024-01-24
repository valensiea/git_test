import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String enteredPin = "";

  void _handleButtonClick(String value) {
    setState(() {
      enteredPin += value;
    });
  }

  void _handleBackspace() {
    setState(() {
      if (enteredPin.isNotEmpty) {
        enteredPin = enteredPin.substring(0, enteredPin.length - 1);
      }
    });
  }

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
                _buildPinDisplay(),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [],
                    ),
                  ],
                ),
                // Spacer(),
                // _buildPinDisplay(),
                _buildPinPad()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInkWellRow(String digit) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Container()],
      ),
    );
  }

  Widget _buildPinPad() {
    return Column(
      children: [
        _buildRowButtons(["1", "2", "3"]),
        _buildRowButtons(["4", "5", "6"]),
        _buildRowButtons(["7", "8", "9"]),
        _buildRowButtons(["Delete", "0", "Clear"]),
      ],
    );
  }

  Widget _buildRowButtons(List<String> values) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: values.map((value) => _buildButton(value)).toList(),
    );
  }

  Widget _buildButton(String value) {
    return InkWell(
      onTap: () {
        if (value == "Delete") {
          _handleBackspace();
        } else if (value == "Clear") {
          _handleClear();
        } else if (value.isNotEmpty) {
          _handleButtonClick(value);
        }
      },
      child: Container(
        width: 80.0, // Set a fixed width for the buttons
        height: 80.0, // Set a fixed height for the buttons
        alignment: Alignment.center,
        decoration: BoxDecoration(
            // shape: BoxShape.circle,
            // color: value.isNotEmpty ? Colors.blue : Colors.transparent,
            ),
        child: value.isNotEmpty
            ? Text(
                value,
                style: TextStyle(fontSize: 18, color: Colors.black),
              )
            : Container(), // Empty container for an empty button
      ),
    );
  }

  void _handleClear() {
    setState(() {
      enteredPin = "";
    });
  }

  Widget _buildPinDisplay() {
    List<Widget> pinWidgets = List.generate(
      6,
      (index) => Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Center(
          child: Text(
            index < enteredPin.length ? enteredPin[index] : "",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: pinWidgets,
    );
  }
}
