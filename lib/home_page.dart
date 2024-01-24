import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> enteredPin = List.filled(6, "_");

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
                        Icon(Icons.security,),
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
                _buildPinPad()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinDisplay() {
    List<Widget> pinWidgets = List.generate(
      6,
      (index) => GestureDetector(
        onTap: () {
          // Handle tap on each digit if needed
        },
        child: Container(
          width: 40,
          height: 40,
          // margin: EdgeInsets.symmetric(horizontal: 2),
          child: Center(
            child: Text(
              enteredPin[index],
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ),
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: pinWidgets,
    );
  }

  Widget _buildPinPad() {
    return Column(
      children: [
        _buildRowButtons(["1", "2", "3"]),
        _buildRowButtons(["4", "5", "6"]),
        _buildRowButtons(["7", "8", "9"]),
        _buildRowButtons(["Clear", "0", "Delete"]),
        SizedBox(height: 20),
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
    Widget buttonChild;
    if (value == "Delete") {
      buttonChild = Icon(Icons.backspace, color: Colors.black);
    } else if (value == "Clear") {
      buttonChild = Icon(Icons.close, color: Colors.black);
    } else {
      buttonChild = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          Text(
            _getNumberWord(value),
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      );
    }

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
          width: 60.0,
          height: 60.0,
          margin: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Add border
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [buttonChild],
          )),
    );
  }

  String _getNumberWord(String value) {
    switch (value) {
      case "0":
        return "zero";
      case "1":
        return "one";
      case "2":
        return "two";
      case "3":
        return "three";
      case "4":
        return "four";
      case "5":
        return "five";
      case "6":
        return "six";
      case "7":
        return "seven";
      case "8":
        return "eight";
      case "9":
        return "nine";
      default:
        return "";
    }
  }

  void _handleButtonClick(String value) {
    setState(() {
      for (int i = 0; i < enteredPin.length; i++) {
        if (enteredPin[i] == "_") {
          enteredPin[i] = value;
          break; // Stop after filling the first empty slot
        }
      }
    });
  }

  void _handleBackspace() {
    setState(() {
      for (int i = enteredPin.length - 1; i >= 0; i--) {
        if (enteredPin[i] != "_") {
          enteredPin[i] = "_";
          break; // Stop after clearing the last filled slot
        }
      }
    });
  }

  void _handleClear() {
    setState(() {
      enteredPin = List.filled(6, "_");
    });
  }
}
