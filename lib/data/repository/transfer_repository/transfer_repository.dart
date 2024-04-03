import '../../my_responce.dart';
import '../../network/api_provider.dart';

class TransferRepository {
  Future<MyResponse> getTransferInfo() async {
    return ApiProvider.getTranfers();
  }
}