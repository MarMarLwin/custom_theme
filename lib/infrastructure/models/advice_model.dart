import 'package:custom_theme/domain/entities/advicer_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel({required String advice, required int id})
      : super(advice: advice, id: id);

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(
        advice: json['advice']!, id: (json['id']! as num).toInt());
  }

  @override
  List<Object?> get props => [advice, id];
}