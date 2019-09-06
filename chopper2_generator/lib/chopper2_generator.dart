library chopper2_generator.dart;

import 'package:build/build.dart';
import 'src/generator.dart';

Builder chopperGeneratorFactory(BuilderOptions options) =>
    chopperGeneratorFactoryBuilder(header: options.config['header'] as String);
