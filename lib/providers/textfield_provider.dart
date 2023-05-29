import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'textfield_provider.g.dart';

@Riverpod(keepAlive: true)
class TextFieldValue extends _$TextFieldValue {
  @override
  String build() => '';

  final FocusNode _focusNode = FocusNode();
  FocusNode get focusNode => _focusNode;

  set onChangeText(String value) => state = value;
}

final textController = TextEditingController();
