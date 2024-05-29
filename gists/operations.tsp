import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";
import "./models.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using TypeSpec.Rest;

namespace GitHub;

@route("/gists")
interface GistsService {
  /**
   * "Lists the authenticated user's gists or if called anonymously, this endpoint returns all public gists:"
   */
  @summary("List gists for the authenticated user")
  @get
  // @operationId("list/gists")
  list(
    ...SinceParameter;
    ...PerPageParameter;
    ...PageParameter;
  ): {
    @statusCode statusCode: 200;
    @body body: BaseGist[];
  }

}
