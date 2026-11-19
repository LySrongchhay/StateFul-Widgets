import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          spacing: 10,
          children: [
            Selection(),
            Selection(isSelected: true),
            Selection(),
            Selection(isSelected: true),
          ],
        ),
      ),
    ),
  ),
);

class Selection extends StatefulWidget {
  const Selection({this.isSelected = false, super.key});
  final bool isSelected;

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  late bool _isSelected = widget.isSelected;

  String get textLabel => _isSelected ? "selected" : "Not selected";
  Color get textColor => _isSelected ? Colors.white : Colors.black;
  Color get backgroundColor =>
      _isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  void changeState() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        onPressed: () => {changeState()},
        child: Center(
          child: Text(textLabel, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}
