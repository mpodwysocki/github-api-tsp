import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using TypeSpec.Rest;

namespace GitHub;

@route("/advisories")
interface AdvisoriesService {
  /**
   * Lists all global security advisories that match the specified parameters. If no other parameters are defined, the request will return only GitHub-reviewed advisories that are not malware.\n\nBy default, all responses will exclude advisories for malware, because malware are not standard vulnerabilities. To list advisories for malware, you must include the `type` parameter in your request, with the value `malware`. For more information about the different types of security advisories, see [About the GitHub Advisory database](https://docs.github.com/code-security/security-advisories/global-security-advisories/about-the-github-advisory-database#about-types-of-security-advisories).
   */
  @summary("List global security advisories")
  @get
  @tag("security-advisories")
  @operationId("security-advisories/list-global-advisories")
  getAdvisories(
    ...GitHubSecurityAdvisoryIdParameter;
    ...GitHubSecurityAdvisoryTypeParameter;
    ...CommonVulnerabilitiesAndExposuresIdParameter;
    ...EcosystemParameter;
    ...SeverityParameter;
    ...CommonWeaknessEnumerationsParameter;
    ...IsWithdrawnParameter;
    ...AffectsParameter;
    ...PublishedParameter;
  ): {

  }
}
