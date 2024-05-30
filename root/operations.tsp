import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi";
import "@typespec/openapi3";
import "./models.tsp";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using TypeSpec.Rest;

namespace GitHub;

@route("/")
interface RootService {
  /**
   * Get Hypermedia links to resources accessible in GitHub's REST API
   */
  @tag("meta")
  @operationId("meta/root")
  @get
  getRoot(): {
    @statusCode statusCode: 200;
    ...RootModel;
  }
}
