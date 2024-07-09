import "@typespec/http";

namespace SharedErrors;

model SharedErrorResponse<T extends numeric, M extends string> {
  @TypeSpec.Http.statusCode _: T;
  @TypeSpec.Http.body body: {
    statusCode: null;
    message: M;
    body: null;
  };
}

@doc("The client has issued an invalid request. This is commonly used to specify validation errors in a request payload.")
model BadRequestResponse extends SharedErrorResponse<400, "Bad Request"> {}

@doc("Http 401 Error. User permission is denied due to invalid token.")
model UnauthorizedResponse extends SharedErrorResponse<401, "Unauthorized"> {}

@doc("Http 403 Error. User permission is denied due to invalid token.")
model ForbiddenResponse extends SharedErrorResponse<403, "Forbidden"> {}

@doc("Http 404 Error. The requested resource is not found.")
model NotFoundResponse extends SharedErrorResponse<404, "Not Found"> {}

@doc("Http 406 Error. The client has requested a MIME type via the Accept header for a value not supported by the server.")
model NotAcceptableResponse
  extends SharedErrorResponse<406, "Not Acceptable"> {}

@doc("Http 415 Error. The client has defined a contentType header that is not supported by the server.")
model UnsupportedMediaTypeResponse
  extends SharedErrorResponse<415, "Unsupported Media Type"> {}

@doc("Http 422 Error. The client has made a valid request, but the server cannot process it. This is often used for APIs for which certain limits have been exceeded.")
model UnprocessableEntityResponse
  extends SharedErrorResponse<422, "Unprocessable Entity"> {}

@doc("Http 429 Error. The client has exceeded the number of requests allowed for a given time window.")
model TooManyRequestsResponse
  extends SharedErrorResponse<429, "Too Many Requests"> {}

@doc("Http 500 Error. An unexpected error on the SmartThings servers has occurred. These errors should be rare.")
model InternalServerErrorResponse
  extends SharedErrorResponse<500, "Internal Server Error"> {}

alias SharedErrorResponses =
  | BadRequestResponse
  | UnauthorizedResponse
  | ForbiddenResponse
  | NotFoundResponse
  | NotAcceptableResponse
  | UnsupportedMediaTypeResponse
  | UnprocessableEntityResponse
  | TooManyRequestsResponse
  | InternalServerErrorResponse;
