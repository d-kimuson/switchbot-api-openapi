import "@typespec/http";
import "./shared-errors.tsp";

using TypeSpec.Http;

// Response
@doc("Returns an object that contains two device lists")
model SuccessResponseBody<T> {
  statusCode: 100;
  message: "success";
  body: T;
}

model ErrorResponseBody<C extends numeric, M extends string> {
  statusCode: C;
  message: M;
  body: null;
}

@doc("Device internal error due to device states not synchronized with server")
model SystemErrorResponseBody extends ErrorResponseBody<190, "System error"> {}

namespace SharedResponse {
  alias GetResponse<T, OtherErrors = never> =
    | {
        @statusCode _: 200;
        @body body: SuccessResponseBody<T>;
      }
    | {
        @statusCode _: 190;
        @body body: SystemErrorResponseBody;
      }
    | SharedErrors.SharedErrorResponses
    | OtherErrors;

  alias PostResponse<T, OtherErrors = never> =
    | {
        @statusCode _: 201;
        @body body: SuccessResponseBody<T>;
      }
    | {
        @statusCode _: 190;
        @body body: SystemErrorResponseBody;
      }
    | SharedErrors.SharedErrorResponses
    | OtherErrors;
}
