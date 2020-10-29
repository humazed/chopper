import 'dart:async';

import 'package:chopper2/chopper2.dart';
import 'package:json_annotation/json_annotation.dart';

part 'json_serializable.g.dart';

part 'json_serializable.chopper2.dart';

@JsonSerializable()
class Resource {
  final String id;
  final String name;

  Resource(this.id, this.name);

  static const fromJsonFactory = _$ResourceFromJson;

  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}

@JsonSerializable()
class ResourceError {
  final String type;
  final String message;

  ResourceError(this.type, this.message);

  static const fromJsonFactory = _$ResourceErrorFromJson;

  Map<String, dynamic> toJson() => _$ResourceErrorToJson(this);
}

Request convertForm(Request req) =>
    applyHeader(req, contentTypeKey, formEncodedHeaders);

@ChopperApi(baseUrl: "/resources")
abstract class MyService extends ChopperService {
  static MyService create([ChopperClient client]) => _$MyService(client);

  @Get(path: "/{id}/")
  Future<Response> getResource(@Path() String id);

  @Get(path: "/all", headers: const {"test": "list"})
  Future<Response<List<Resource>>> getResources();

  @Get(path: "/")
  Future<Response<Map>> getMapResource(@Query() String id);

  @Get(path: "/", headers: const {"foo": "bar"})
  Future<Response<Resource>> getTypedResource();

  @Post()
  Future<Response<Resource>> newResource(@Body() Resource resource,
      {@Header() String name});

  @Post(path: "feilds/post")
  Future<Response> fieldsPost(
    @Field('1') String a,
    @Field('2') int b,
    @Field('3') double c,
  );

  @Post(path: 'multi')
  @multipart
  Future<Response> postResources(
    @Part('1') Map a,
    @Part('2') Map b,
    @Part('3') String c,
  );

  @Post(path: 'file')
  @multipart
  Future<Response> postFile(
    @PartFile('file') List<int> bytes,
  );

  @Post(path: 'file')
  @multipart
  Future<Response> postMultiOptional(
    @Part('map') Map map,
    @Part('str') String str,
    @PartFile('file') List<int> bytes, {
    @Part('opMap') Map opMap,
    @Part('opStr') String opStr,
    @PartFile('opBytes') List<int> opBytes,
  });

  @Post(
    path: '/',
    headers: {contentTypeKey: formEncodedHeaders},
  )
  @FactoryConverter(request: convertForm)
  Future<Response> postResourceUrlEncoded(
    @Field('a') String toto,
    @Field() String b,
  );
}
