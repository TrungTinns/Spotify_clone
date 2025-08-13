import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spotify_clone/common/config/app_config.dart';
import 'package:spotify_clone/main.dart' as common;
import 'package:spotify_clone/service_locator.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  AppConfig appConfig = AppConfig(
    env: Environment.dev,
    config: {
      supabaseUrl: dotenv.env['SUPABASE_URL'],
      supabaseAnonKey: dotenv.env['SUPABASE_ANON_KEY'],
    },
  );
  sl.registerSingleton<AppConfig>(appConfig);
  common.main();
}
