import 'package:dartz/dartz.dart';
import '../../../domain/repository/song/song_repository.dart';
import '../../../service_locator.dart';
import '../../source/song/song_supabase_service.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongSupabaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await sl<SongSupabaseService>().getPlayList();
  }
}
