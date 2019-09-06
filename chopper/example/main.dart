import 'package:chopper2/chopper.dart';
import 'package:chopper2/src/interceptor.dart';
import 'definition.dart';

main() async {
  final chopper = ChopperClient(
    baseUrl: "http://localhost:8000",
    services: [
      // the generated service
      MyService.create()
    ],
    converter: JsonConverter(),
  );

  final myService = chopper.getService<MyService>();

  final response = await myService.getMapResource("1");
  print(response.body);

  final list = await myService.getListResources();
  print(list.body);

  chopper.dispose();
}
