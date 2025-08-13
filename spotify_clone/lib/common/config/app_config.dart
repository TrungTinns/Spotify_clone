enum Environment { production, staging, dev }

const String supabaseUrl = "_supabaseUrl";
const String supabaseAnonKey = "_anonKey";

class AppConfig {
  Map<String, dynamic> config;
  Environment env;

  AppConfig({required this.config, required this.env});

  get supabaseURL => config[supabaseUrl] ?? "";
  get anonKey => config[supabaseAnonKey] ?? "";
}
