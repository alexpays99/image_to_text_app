import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../../core/domain/entities/failure.dart';
import '../models/artist_list_track/datum.dart';

class AIGenerativeService {
  AIGenerativeService();

  final logger = Logger();
  final model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: const String.fromEnvironment("API_KEY").toString(),
  );

  Future<Either<Failure, String>> describeImage(
      String base64ImageFormat) async {
    const prompt = 'Explain what is flutter in short';
    final content = [Content.text(prompt)];
    try {
      final response = await model.generateContent(content);
      logger.d('MODEL RESPONCE: ${response.text}');
      return right(response.text ?? '');
    } catch (e) {
      logger.d('MODEL EXCEPTION: $e');
      return left(throw Exception(e));
    }
  }

  Future<Either<Failure, List<Datum>>> fetchArtistTrackList(
      {required String url}) async {
    try {
      return right([]);
    } catch (e) {
      return left(throw Exception(e));
    }
  }
}
