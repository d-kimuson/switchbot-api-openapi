import "@typespec/http";

using TypeSpec.Http;

namespace SharedErrors;

model SharedErrorResponseBody<M extends string> {
  @body body: {
    statusCode: never;
    message: M;
    body: never;
  };
}

@doc("The client has issued an invalid request. This is commonly used to specify validation errors in a request payload.")
model BadRequestResponse extends SharedErrorResponseBody<"Bad Request"> {
  @statusCode _: 400;
}

@doc("Http 401 Error. User permission is denied due to invalid token.")
model UnauthorizedResponse extends SharedErrorResponseBody<"Unauthorized"> {
  @statusCode _: 401;
}

@doc("Http 403 Error. User permission is denied due to invalid token.")
model ForbiddenResponse extends SharedErrorResponseBody<"Forbidden"> {
  @statusCode _: 403;
}

@doc("Http 404 Error. The requested resource is not found.")
model NotFoundResponse extends SharedErrorResponseBody<"Not Found"> {
  @statusCode _: 404;
}

@doc("Http 406 Error. The client has requested a MIME type via the Accept header for a value not supported by the server.")
model NotAcceptableResponse extends SharedErrorResponseBody<"Not Acceptable"> {
  @statusCode _: 406;
}

@doc("Http 415 Error. The client has defined a contentType header that is not supported by the server.")
model UnsupportedMediaTypeResponse
  extends SharedErrorResponseBody<"Unsupported Media Type"> {
  @statusCode _: 415;
}

@doc("Http 422 Error. The client has made a valid request, but the server cannot process it. This is often used for APIs for which certain limits have been exceeded.")
model UnprocessableEntityResponse
  extends SharedErrorResponseBody<"Unprocessable Entity"> {
  @statusCode _: 422;
}

@doc("Http 429 Error. The client has exceeded the number of requests allowed for a given time window.")
model TooManyRequestsResponse
  extends SharedErrorResponseBody<"Too Many Requests"> {
  @statusCode _: 429;
}

@doc("Http 500 Error. An unexpected error on the SmartThings servers has occurred. These errors should be rare.")
model InternalServerErrorResponse
  extends SharedErrorResponseBody<"Internal Server Error"> {
  @statusCode _: 500;
}

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
