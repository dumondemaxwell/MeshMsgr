import 'dart:ffi';

class DataEndpoint {
  String name;
  String endpoint;
  bool canModify;

  DataEndpoint({required this.name, required this.endpoint, required this.canModify});
}

class EndpointStorageService {
  List<DataEndpoint> endpoints = [
    DataEndpoint(name: 'Infura1', endpoint: 'https://mainnet.infura.io/v3/your_project_id', canModify: true),
    DataEndpoint(name: 'Infura2', endpoint: 'https://mainnet.infura.io/v3/your_project_id', canModify: true)
  ];

  DataEndpoint current = DataEndpoint(name: 'Infura1', endpoint: 'https://mainnet.infura.io/v3/your_project_id', canModify: true);

  getEndpointInfo(String name){
    return endpoints.firstWhere((element) => element.name == name);
  }

  void addEndpoint(String name, String endpoint){
    endpoints.add(DataEndpoint(name: name, endpoint: endpoint, canModify: true));
  }

  void removeEndpoint(String name){
    endpoints.removeWhere((element) => element.name == name);
  }

  void updateEndpoint(String name, String endpoint){
    var endpointInfo = endpoints.firstWhere((element) => element.name == name);
    endpointInfo.endpoint = endpoint;
  }
}