import 'data_model.dart';

class TransferModel{
  final String transferDate;
  final List<DataModel> transfersData;

  TransferModel({
    required this.transferDate,
    required this.transfersData,
  });

  factory TransferModel.fromJson(Map<String, dynamic> json) => TransferModel(
    transferDate: json['transfer_date'] as String? ?? "",
    transfersData: List<DataModel>.from(json['data'].map((x) => DataModel.fromJson(x))),
  );
}