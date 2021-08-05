import 'package:flutter/material.dart';

class CreateBody extends StatefulWidget {
  final String actionName;
  final void Function(String) onDonePressed;
  final String hintText;
  final String? startWithInput;

  const CreateBody(
      {Key? key,
      required this.actionName,
      required this.onDonePressed,
      required this.hintText,
      this.startWithInput})
      : super(key: key);

  @override
  _CreateBodyState createState() => _CreateBodyState();
}

class _CreateBodyState extends State<CreateBody> {
  String _value = "";

  // Constants
  final String confirmAction = "Done";
  final double innerPadding = 20.0;
  void onPressedWithValue() {
    widget.onDonePressed(_value);
    Navigator.of(context).pop();
  }

  bool isValueCorrect() {
    return _value.isNotEmpty;
  }

  void updateValue(String newValue) {
    setState(() {
      this._value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CloseCTA(),
                Expanded(child: Text(widget.actionName)),
                DoneCTA(
                  confirmAction: confirmAction,
                  valueChecker: isValueCorrect,
                  onDonePressed: onPressedWithValue,
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                // border: Border.symmetric(
                //     horizontal: BorderSide(color: Colors.grey, width: 0.5))),
                ),
            padding: EdgeInsets.all(15),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                initialValue: widget.startWithInput,
                decoration: InputDecoration(hintText: widget.hintText),
                autofocus: true,
                onChanged: updateValue,
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: Container(
                color: Colors.grey.shade300,
              ),
            ),
          )
        ],
      )),
    );
  }
}

class CloseCTA extends StatelessWidget {
  const CloseCTA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class DoneCTA extends StatelessWidget {
  const DoneCTA({
    Key? key,
    required this.confirmAction,
    required this.valueChecker,
    required this.onDonePressed,
  }) : super(key: key);

  final String confirmAction;

  final bool Function() valueChecker;
  final void Function() onDonePressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: valueChecker() ? onDonePressed : null,
        child: Text(confirmAction),
      ),
    );
  }
}
