import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/helpers/validator.dart';

class Input extends StatefulWidget {
  Input(
      {@required this.controller,
      this.label,
      this.placeholder,
      this.error,
      this.icon,
      this.node,
      this.enabled = true,
      this.autocorrect = false,
      this.autofocus = false,
      this.isPassword = false,
      this.enableSuggestions = false,
      this.keyboardType = TextInputType.text,
      this.onChange,
      this.formatters,
      this.type,
      this.suffix,
      this.textInputFormatterType = TextInputFormatterType.none,
      Key key})
      : super(key: key);

  final String label;
  final String placeholder;
  final String error;
  final IconData icon;
  final Widget suffix;
  final FocusNode node;
  final TextEditingController controller;
  final bool enabled;
  final bool autocorrect;
  final bool autofocus;
  final bool isPassword;
  final bool enableSuggestions;
  final TextInputType keyboardType;
  final void Function(String) onChange;
  final List<TextInputFormatter> formatters;
  final TextInputType type;
  final TextInputFormatterType textInputFormatterType;

  InputState createState() => InputState();
}

class InputState extends State<Input> {
  FocusNode focusNode;

  @override
  void dispose() {
    if (widget.node == null) {
      focusNode?.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    focusNode = widget.node ?? FocusNode();
  }

  void formatValue(String value) {
    num _value = num.tryParse(value.replaceAll(',', '')) ?? 0;
    String _val = toCurrencyString(
      _value.toString(),
      useSymbolPadding: false,
      mantissaLength: 0,
      leadingSymbol: '',
      thousandSeparator: ThousandSeparator.Comma,
    );
    if (widget.controller != null) {
      widget.controller.value = TextEditingValue(
        text: _val,
        selection: TextSelection.fromPosition(
          TextPosition(offset: _val.length),
        ),
      );
    }
    widget.onChange(_val);
  }

  InputDecoration getDecorator() => InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          color: widget.error != null ? Colors.red[200] : textColor,
          fontSize: 14,
        ),
        hintText: widget.placeholder,
        prefixIcon: widget.icon != null
            ? Icon(widget.icon,
                color: widget.error != null ? Colors.red[200] : textColor)
            : null,
        suffixIcon: widget.suffix,
        errorText: widget.error,
        errorMaxLines: 2,
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      focusNode: focusNode,
      controller: widget.controller,
      enabled: widget.enabled,
      autocorrect: widget.autocorrect,
      autofocus: widget.autofocus,
      obscureText: widget.isPassword,
      enableSuggestions: widget.enableSuggestions,
      decoration: getDecorator(),
      inputFormatters: <TextInputFormatter>[
        ...widget.formatters ?? <TextInputFormatter>[],
        if (widget.type == TextInputType.phone)
          MaskedInputFormatter(
            '### ### ####',
            anyCharMatcher: RegExp(r'[0-9]'),
          ),
        if (widget.textInputFormatterType == TextInputFormatterType.money &&
            widget.type == TextInputType.number) ...<TextInputFormatter>[
          MoneyInputFormatter(mantissaLength: 0),
          LengthLimitingTextInputFormatter(11),
        ]
      ],
      onChanged: (String value) {
        if (widget.textInputFormatterType == TextInputFormatterType.money) {
          formatValue(value);
        } else if (widget.onChange != null) {
          widget.onChange(value);
        }
      },
    );
  }
}
