import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';
import 'package:spotify_clone/data/models/auth/signin_user_req.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthSupabaseService {
  Future<Either> signIn(SigninUserReq signinUserReq);
  Future<Either> signUp(CreateUserReq createUserReq);
}

class AuthSupabaseServiceImpl extends AuthSupabaseService {
  final SupabaseClient _supabaseClient;

  AuthSupabaseServiceImpl({required SupabaseClient supabaseClient})
    : _supabaseClient = supabaseClient;

  @override
  Future<Either> signIn(SigninUserReq signinUserReq) async {
    try {
      await _supabaseClient.auth.signInWithPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );

      return Right('Signin successfully');
    } on AuthException catch (e) {
      String message = '';

      if (e.code == 'invalid-email') {
        message = 'User can not found';
      } else if (e.code == 'invalid-credential') {
        message = 'Password is wrong';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    try {
      final data = await _supabaseClient.auth.signUp(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      await _supabaseClient
          .from('users')
          .update({'name': createUserReq.fullName, 'email': data.user?.email})
          .eq('id', _supabaseClient.auth.currentUser!.id);
      return Right('Signup successfully');
    } on AuthException catch (e) {
      String message = '';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email';
      }
      return Left(message);
    }
  }
}
