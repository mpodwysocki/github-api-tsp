import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi";
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
  @operationId("list/gists")
  @tag("gists")
  list(
    ...SinceParameter;
    ...PerPageParameter;
    ...PageParameter;
  ): {
    @statusCode statusCode: 200;
    @body body: BaseGist[];
    ...LinkResponseHeader;
  };

  /**
   * Allows you to add a new gist with one or more files.\n\n**Note:** Don't name your files \"gistfile\" with a numerical suffix. This is the format of the automatic naming scheme that Gist uses internally.
   */
  @summary("Create a gist")
  @post
  @operationId("create/gist")
  @tag("gists")
  create(
    @body body: CreateGistRequest;
  ): {
    @statusCode statusCode: 201;
    @body body: BaseGist;
    ...LocationResponseHeader;
  }
}
