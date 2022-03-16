import 'package:flutter/material.dart';

class TopicTextForm extends StatelessWidget {
  const TopicTextForm({
    Key key,
    @required TextEditingController titleTextController,
    int maxLine = 1,
    @required validationText,
  })  : _titleTextController = titleTextController,
        _validationText = validationText,
        _maxLine = maxLine,
        super(key: key);

  final TextEditingController _titleTextController;
  final int _maxLine;
  final String _validationText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _titleTextController,
      cursorColor: Colors.grey,
      maxLines: _maxLine,
      validator: (value) {
        return value.isNotEmpty ? null : _validationText;
      },
      decoration: const InputDecoration(
        // Enabled Border
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        // Focused Border
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        // Focused Error Border
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        fillColor: Colors.white,
        isDense: true,
        contentPadding: EdgeInsets.only(top: 8, bottom: 8),
      ),
    );
  }
}
