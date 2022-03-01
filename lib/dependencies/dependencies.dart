import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'dependencies.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: false, // default
  asExtension: false, // default
  usesNullSafety: true,
)
Future<void> setupDependencies() async => $initGetIt(getIt);
