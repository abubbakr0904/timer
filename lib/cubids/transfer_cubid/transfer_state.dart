import '../../data/model/transfer_model.dart';

abstract class TransferState {}

class TransferInitialState extends TransferState {}

class TransferLoadingState extends TransferState {}

class TransferSuccessState extends TransferState {
  final List<TransferModel> transfers;

  TransferSuccessState({required this.transfers});
}
class TransferFailureState extends TransferState {
  final String message;
  TransferFailureState({required this.message});
}