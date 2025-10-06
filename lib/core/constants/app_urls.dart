import '../../common/config/app_config.dart';
import '../../service_locator.dart';

class AppURLs {
  static final supabaseUrl = sl<AppConfig>().supabaseURL;
  static String  coverStorage =
      '$supabaseUrl/storage/v1/object/public/songs/cover/';
  static String songStorage =
      '$supabaseUrl/storage/v1/object/public/songs/song/';
  static const defaultImage =
      'https://cdn-icons-png.flaticon.com/512/10542/10542486.png';
}
