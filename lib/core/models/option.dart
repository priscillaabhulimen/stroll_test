import 'package:freezed_annotation/freezed_annotation.dart';

part 'option.freezed.dart';

@freezed
class OptionObject with _$OptionObject {
  factory OptionObject({
    required String id,
    required String title,
  }) = _OptionObject;
}
