import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../domain/entities/song/song_entity.dart';
import '../../models/song/song_model.dart';

abstract class SongSupabaseService {
  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
}

class SongSupabaseServiceImpl extends SongSupabaseService {
  final SupabaseClient _supabaseClient;

  SongSupabaseServiceImpl({required SupabaseClient supabaseClient})
    : _supabaseClient = supabaseClient;

  @override
  Future<Either> getNewsSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await _supabaseClient.from('songs').select('*');

      for (var element in data) {
        var songModel = SongModel.fromJson(element);
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, Please try again.');
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      List<SongEntity> songs = [];
      var data = await _supabaseClient.from('songs').select('*');

      for (var element in data) {
        var songModel = SongModel.fromJson(element);

        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, Please try again.');
    }
  }
}
