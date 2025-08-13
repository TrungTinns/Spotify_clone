import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:spotify_clone/common/config/app_config.dart';
import 'package:spotify_clone/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_clone/data/source/auth/auth_supabase_service.dart';
import 'package:spotify_clone/domain/repository/auth.dart';
import 'package:spotify_clone/domain/usecases/auth/signin.dart';
import 'package:spotify_clone/domain/usecases/auth/signup.dart';
import 'package:spotify_clone/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final appConfig = sl<AppConfig>();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Supabase.initialize(
    url: appConfig.supabaseURL,
    anonKey: appConfig.anonKey,
  );

  sl.registerSingleton<AuthSupabaseService>(
    AuthSupabaseServiceImpl(supabaseClient: Supabase.instance.client),
  );

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignupUsecase>(SignupUsecase());

  sl.registerSingleton<SigninUsecase>(SigninUsecase());
}
