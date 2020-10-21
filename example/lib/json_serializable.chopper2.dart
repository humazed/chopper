// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_serializable.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$MyService extends MyService {
  _$MyService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MyService;

  @override
  Future<Response<dynamic>> getResource(String id) {
    final $url = '/resources/$id/';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<Resource>>> getResources() {
    final $url = '/resources/all';
    final $headers = {'test': 'list'};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<List<Resource>, Resource>($request);
  }

  @override
  Future<Response<Map<dynamic, dynamic>>> getMapResource(String id) {
    final $url = '/resources/';
    final $params = <String, dynamic>{'id': id};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Map<dynamic, dynamic>, Map<dynamic, dynamic>>($request);
  }

  @override
  Future<Response<Resource>> getTypedResource() {
    final $url = '/resources/';
    final $headers = {'foo': 'bar'};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<Resource, Resource>($request);
  }

  @override
  Future<Response<Resource>> newResource(Resource resource, {String name}) {
    final $url = '/resources';
    final $headers = {'name': name};
    final $body = resource;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<Resource, Resource>($request);
  }

  @override
  Future<Response<dynamic>> fieldsPost(String a, int b, double c) {
    final $url = '/resources/feilds/post';
    final $body = <String, dynamic>{'1': a, '2': b, '3': c};
    $body.removeWhere((key, value) => value == null);
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> postResources(
      Map<dynamic, dynamic> a, Map<dynamic, dynamic> b, String c) {
    final $url = '/resources/multi';
    final $parts = <PartValue>[
      a == null ? null : PartValue<Map>('1', a),
      b == null ? null : PartValue<Map>('2', b),
      c == null ? null : PartValue<String>('3', c)
    ];
    $parts.removeWhere((val) => val == null);
    final $request =
        Request('POST', $url, client.baseUrl, parts: $parts, multipart: true);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> postFile(List<int> bytes) {
    final $url = '/resources/file';
    final $parts = <PartValue>[
      bytes == null ? null : PartValueFile<List<int>>('file', bytes)
    ];
    $parts.removeWhere((val) => val == null);
    final $request =
        Request('POST', $url, client.baseUrl, parts: $parts, multipart: true);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> postMultiOptional(
      Map<dynamic, dynamic> map, String str, List<int> bytes,
      {Map<dynamic, dynamic> opMap, String opStr, List<int> opBytes}) {
    final $url = '/resources/file';
    final $parts = <PartValue>[
      map == null ? null : PartValue<Map>('map', map),
      str == null ? null : PartValue<String>('str', str),
      opMap == null ? null : PartValue<Map>('opMap', opMap),
      opStr == null ? null : PartValue<String>('opStr', opStr),
      bytes == null ? null : PartValueFile<List<int>>('file', bytes),
      opBytes == null ? null : PartValueFile<List<int>>('opBytes', opBytes)
    ];
    $parts.removeWhere((val) => val == null);
    final $request =
        Request('POST', $url, client.baseUrl, parts: $parts, multipart: true);
    return client.send<dynamic, dynamic>($request);
  }
}
