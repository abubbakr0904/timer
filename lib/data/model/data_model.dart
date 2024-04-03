import 'package:timer/data/model/sender_model.dart';

class DataModel {
  final int transactionCode;
  final DateTime date;
  final int incomeId;
  final double amount;
  final int cardId;
  final SenderModel sender;

  DataModel({
    required this.transactionCode,
    required this.date,
    required this.incomeId,
    required this.amount,
    required this.cardId,
    required this.sender,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      transactionCode: json['transaction_code'] as int? ?? 0,
      date: DateTime.parse(json['date']),
      incomeId: json['income_id'],
      amount: json['amount'],
      cardId: json['card_id'],
      sender: SenderModel.fromJson(json['sender']),
    );
  }
}