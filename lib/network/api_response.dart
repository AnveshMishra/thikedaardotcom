enum ApiResponseStatus {
  none,
  loading,
  success,
  error,
}

class ApiResponse<T> {
  ApiResponseStatus status;
  String? errorMessage;
  T? data;

  ApiResponse.none()
      : status = ApiResponseStatus.none,
        data = null,
        errorMessage = null;

  ApiResponse.loading()
      : status = ApiResponseStatus.loading,
        data = null,
        errorMessage = null;

  ApiResponse.success(T this.data)
      : status = ApiResponseStatus.success,
        errorMessage = null;

  ApiResponse.error(String this.errorMessage)
      : status = ApiResponseStatus.error,
        data = null;
}
