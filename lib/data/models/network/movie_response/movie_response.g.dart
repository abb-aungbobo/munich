// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      id: (json['id'] as num).toInt(),
      posterPath: json['poster_path'] as String?,
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      overview: json['overview'] as String?,
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.posterPath,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'overview': instance.overview,
    };
