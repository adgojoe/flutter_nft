import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class ContractLinking extends ChangeNotifier {
  late Web3Client _client;
  late String _abiCode;
  late EthereumAddress _contractAddress;
  bool isLoading = true;

  ContractLinking() {
    initialSetup();
  }

  initialSetup() async {
    _client = Web3Client("https://rpc-mumbai.maticvigil.com/", Client());

    await getAbi();
    await getDeployedContract();
    isLoading = false;
    notifyListeners();
  }

  Future<void> getAbi() async {
    // Reading the contract abi
    _abiCode = await rootBundle.loadString("assets/abi.json");
    _contractAddress =
        EthereumAddress.fromHex("0xF824019F58b4f57d91E540ACfBC6e4B071770b62");
  }

  Future<void> getDeployedContract() async {
    DeployedContract _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "HelloWorld"), _contractAddress);
    var func = _contract.function("name");
    var result =
        await _client.call(contract: _contract, function: func, params: []);
    print(result.first);
  }
}
