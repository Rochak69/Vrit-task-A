import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/core/dio_provider/api_error.dart';
import 'package:lookup/core/dio_provider/api_response.dart';
import 'package:lookup/core/dio_provider/dio_api_client.dart';
import 'package:lookup/features/homepage/data/model/picture_response.dart';
import 'package:lookup/utils/app_endpoint.dart';

@injectable
class HomeRemoteSource {
  HomeRemoteSource(
    this._client,
  );
  final DioApiClient _client;

  Future<Either<AppError, ApiResponseForList<PictureResponse>>> fetchData({
    String? search,
    int page = 20,
  }) async {
    try {
      final param = <String, dynamic>{
        'per_page': page,
        'query': search == null || search.isEmpty ? 'Cars' : search,
      };

      final response = await _client.httpGet<dynamic>(
        AppEndpoints.images,
        queryParameters: param,
      );

      return right(
        ApiResponseForList(
          data: (response['photos'] as List<dynamic>)
              .map((e) => PictureResponse.fromJson(e))
              .toList(),
          paginationInfo: PaginationInfo.fromResponse(response),
        ),
      );
    } catch (e) {
      if (e is ApiErrorResponse) {
        return left(e);
      } else {
        return left(const InternalAppError());
      }
    }
  }
}
