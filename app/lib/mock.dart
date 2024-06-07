// 模拟api接口数据
class MockApi {
  List<MockData>? mockData;

  MockApi({this.mockData});

  MockApi.fromJson(Map<String, dynamic> json) {
    mockData = <MockData>[];
    if (json['data'] != null) {
      json['data'].forEach((item) {
        mockData!.add(MockData.fromJson(item));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mockData != null) {
      data['data'] = mockData!.map((item) => item.toJson()).toList();
    }
    return data;
  }
}

class MockData {
  int? id;
  String? name;
  String? address;
  String? content;

  MockData({required this.id, required this.name, required this.address, required this.content});

  MockData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['content'] = content;

    return data;
  }
}

MockApi response = MockApi.fromJson({
  "data": [
    {"id": 1, "name": "tom", "address": "xian", "content": "test info tom"},
    {"id": 2, "name": "bob", "address": "beijing", "content": "test info bob"},
    {"id": 3, "name": "jerry", "address": "shanghai", "content": "test info jerry"},
  ]
});
