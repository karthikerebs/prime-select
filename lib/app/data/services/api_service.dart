import 'dart:developer';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'dart:io';
import 'package:omiga/app/core/Utilities/storageutil.dart';
import 'package:omiga/app/core/Utilities/toasts.dart';
import 'package:omiga/app/core/constants/urls.dart';

class ApiService {
  late final dio.Dio _dio;

  // Constructor: Initializes the Dio instance with base configuration and adds an auth interceptor
  ApiService() {
    _dio = dio.Dio(dio.BaseOptions(
      baseUrl: AppUrls.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ));
    _dio.interceptors.add(_AuthInterceptor());
  }

  // UNAUTHENTICATED API CALLS

  /// Sends a POST request without authentication
  ///
  /// This method is used for endpoints that don't require user authentication,
  /// such as login or registration.
  ///
  /// @param url The endpoint URL
  /// @param data The request payload
  /// @return A Future containing the response data as a Map, or null if the request fails
  Future<Map<String, dynamic>?> postRequest({
    required String url,
    required Map<String, dynamic> data,
  }) =>
      _sendRequest('POST', url, data: data, requiresAuth: false);

  /// Sends a GET request without authentication
  ///
  /// Used for fetching public data that doesn't require user authentication.
  ///
  /// @param url The endpoint URL
  /// @return A Future containing the response data as a Map, or null if the request fails
  Future<Map<String, dynamic>?> getRequest(String url) =>
      _sendRequest('GET', url, requiresAuth: false);

  /// Sends a multipart POST request without authentication
  ///
  /// This method is used for uploading files to endpoints that don't require authentication.
  ///
  /// @param url The endpoint URL
  /// @param data Additional form data to be sent with the request
  /// @param file The File object to be uploaded
  /// @param fileKey The key to be used for the file in the multipart request
  /// @return A Future containing the response data as a Map, or null if the request fails
  Future<Map<String, dynamic>?> multipartRequest({
    required String url,
    required Map<String, dynamic> data,
    required File file,
    required String fileKey,
  }) =>
      _sendRequest('POST', url,
          data: data, file: file, fileKey: fileKey, requiresAuth: false);

  // AUTHENTICATED API CALLS

  /// Sends an authenticated POST request
  ///
  /// Used for endpoints that require user authentication, such as updating user profile or
  /// submitting user-specific data.
  ///
  /// @param url The endpoint URL
  /// @param data The request payload
  /// @return A Future containing the response data as a Map, or null if the request fails
  Future<Map<String, dynamic>?> authPostRequest({
    required String url,
    required Map<String, dynamic> data,
  }) =>
      _sendRequest('POST', url, data: data, requiresAuth: true);

  /// Sends an authenticated GET request
  ///
  /// Used for fetching user-specific or protected data that requires authentication.
  ///
  /// @param url The endpoint URL
  /// @return A Future containing the response data as a Map, or null if the request fails
  Future<Map<String, dynamic>?> authGetRequest({required String url}) =>
      _sendRequest('GET', url, requiresAuth: true);

  /// Sends an authenticated multipart POST request
  ///
  /// This method is used for uploading files to endpoints that require user authentication,
  /// such as updating a user's profile picture.
  ///
  /// @param url The endpoint URL
  /// @param data Additional form data to be sent with the request
  /// @param file The File object to be uploaded
  /// @param fileKey The key to be used for the file in the multipart request
  /// @return A Future containing the response data as a Map, or null if the request fails
  Future<Map<String, dynamic>?> authMultipartRequest({
    required String url,
    required Map<String, dynamic> data,
    required File file,
    required String fileKey,
  }) =>
      _sendRequest('POST', url,
          data: data, file: file, fileKey: fileKey, requiresAuth: true);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // Private methods

  /// Core method for sending HTTP requests
  ///
  /// This private method is the central point for all API calls. It handles both
  /// authenticated and unauthenticated requests, as well as multipart requests for file uploads.
  /// It also manages error handling and response processing.
  ///
  /// @param method The HTTP method (GET, POST, etc.)
  /// @param url The endpoint URL
  /// @param data The request payload (for POST requests)
  /// @param requiresAuth Whether the request requires authentication
  /// @param file The File object for multipart requests (optional)
  /// @param fileKey The key for the file in multipart requests (optional)
  /// @param queryParameters Additional query parameters for the request (optional)
  /// @return A Future containing the processed response data as a Map, or null if the request fails
  Future<Map<String, dynamic>?> _sendRequest(
    String method,
    String url, {
    Map<String, dynamic>? data,
    bool requiresAuth = false,
    File? file,
    String? fileKey,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final options = dio.Options(
        method: method,
        headers: requiresAuth
            ? {'Authorization': 'Bearer ${StorageUtil.getBearerToken()}'}
            : null,
      );

      dio.Response response;
      if (file != null && fileKey != null) {
        final formData = dio.FormData.fromMap({
          ...?data,
          fileKey: await dio.MultipartFile.fromFile(file.path),
        });
        response = await _dio.request(url,
            data: formData, options: options, queryParameters: queryParameters);
      } else {
        response = await _dio.request(url,
            data: data, options: options, queryParameters: queryParameters);
      }

      return _handleResponse(response, url);
    } on dio.DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      _showError('An unexpected error occurred');

      return null;
    }
  }

  /// Processes the API response
  ///
  /// This method handles the response from the API, checking for success status codes,
  /// handling authentication errors, and showing appropriate messages to the user.
  ///
  /// @param response The Dio Response object
  /// @return The processed response data as a Map, or null if there's an error
  Map<String, dynamic>? _handleResponse(dio.Response response, String url) {
    final data = response.data as Map<String, dynamic>;

    log('Response url: $url');
    log('Response status code: ${response.statusCode}');

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      if (response.data['sts'] == '01') {
        return data;
      } else {
        _showError(data['msg'] ?? 'Operation was not successful',
            forceShow: true);
        return null;
      }
    } else {
      // Handle 400 and other error status codes
      _showError(data['msg'] ?? 'Operation was not successful',
          forceShow: true);
      log('Response data: ${data['msg']}');
      log('Response status code: ${response.statusCode}');
      return null;
    }
  }

  /// Handles Dio-specific errors
  ///
  /// This function processes errors thrown by Dio during HTTP requests. It categorizes
  /// different types of errors and provides appropriate error messages to the user.
  ///
  /// @param error The DioException object
  /// @return null, as this function is primarily for error handling and doesn't return valid data
  Future<Map<String, dynamic>?> _handleDioError(dio.DioException error) async {
    String errorMessage;
    log('Dio error: ${error.response?.data}');
    log('Dio error status code: ${error.response?.statusCode}');

    if (error.response?.statusCode == 401) {
      errorMessage = 'Authentication failed: Please login again';
      await StorageUtil.clearAll();
      // Future.microtask(() => Get.offAllNamed(Routes.LOGIN));
    } else {
      switch (error.type) {
        case dio.DioExceptionType.connectionTimeout:
        case dio.DioExceptionType.sendTimeout:
        case dio.DioExceptionType.receiveTimeout:
          errorMessage = 'Connection timed out';
          break;
        case dio.DioExceptionType.badResponse:
          if (error.response?.data is Map) {
            errorMessage =
                error.response?.data['msg']?.toString() ?? 'Server error';
          } else if (error.response?.data is String) {
            errorMessage = error.response?.data ?? 'Server error';
          } else {
            errorMessage = 'Server error';
          }
          break;
        case dio.DioExceptionType.cancel:
          errorMessage = 'Request was cancelled';
          break;
        default:
          errorMessage = 'An unexpected error occurred';
      }
    }
    _showError(errorMessage);

    return null;
  }

  /// Displays an error message to the user
  ///
  /// This utility function shows an error toast message to inform the user about issues.
  ///
  /// @param message The error message to be displayed
  /// @param forceShow Whether to force showing the error toast, closing any existing snackbar
  void _showError(String message, {bool forceShow = false}) {
    if (forceShow) {
      // Close any existing snackbar before showing the new one
      Get.closeAllSnackbars();
    }
    Toasts.showError(message);
  }
}

/// Interceptor for adding authentication token to requests
///
/// This class intercepts outgoing requests and adds the authentication token
/// to the headers if it's available. This ensures that authenticated requests
/// always include the necessary authorization.
class _AuthInterceptor extends dio.Interceptor {
  @override
  void onRequest(
      dio.RequestOptions options, dio.RequestInterceptorHandler handler) async {
    final token = await StorageUtil.getBearerToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
