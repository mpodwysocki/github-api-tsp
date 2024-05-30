import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using TypeSpec.Rest;

namespace GitHub;

model GitHubSecurityAdvisoryIdParameter {
  /**
   * If specified, only advisories with this GHSA (GitHub Security Advisory) identifier will be returned.
   */
  @query ghsa_id?: string;
}

model GitHubSecurityAdvisoryTypeParameter {
  /**
   * "If specified, only advisories of this type will be returned. By default, a request with no other parameters defined will only return reviewed advisories that are not malware.
   */
  @query type?: "reviewed" | "malware" | "unreviewed" = "reviewed";
}

model CommonVulnerabilitiesAndExposuresIdParameter {
  /**
   * If specified, only advisories with this CVE (Common Vulnerabilities and Exposures) identifier will be returned.
   */
  @query cve_id?: string;
}

model EcosystemParameter {
  /**
   * If specified, only advisories affecting packages of this ecosystem will be returned.
   */
  @query ecosystem?: SecurityAdvisoryEcosystems;
}

enum SecurityAdvisoryEcosystems {
  "rubygems",
  "npm",
  "pip",
  "maven",
  "nuget",
  "composer",
  "go",
  "rust",
  "erlang",
  "actions",
  "pub",
  "other",
  "swift"
}

model SeverityParameter {
  /**
   * If specified, only advisories with this severity will be returned.
   */
  @query severity?: "unknown" | "low" | "medium" | "high" | "critical";
}

model CommonWeaknessEnumerationsParameter {
  /**
   * If specified, only advisories with these Common Weakness Enumerations (CWEs) will be returned.\n\nExample: `cwes=79,284,22` or `cwes[]=79&cwes[]=284&cwes[]=22`
   */
  @oneOf
  @query cwes?: string | string[];
}

model IsWithdrawnParameter {
  /**
   * Whether to only return advisories that have been withdrawn.
   */
  @query is_withdrawn?: boolean;
}

model AffectsParameter {
  /**
   * If specified, only return advisories that affect any of `package` or `package@version`. A maximum of 1000 packages can be specified.\nIf the query parameter causes the URL to exceed the maximum URL length supported by your client, you must specify fewer packages.\n\nExample: `affects=package1,package2@1.0.0,package3@^2.0.0` or `affects[]=package1&affects[]=package2@1.0.0`
   */
  @oneOf
  @query affects?: string | MaxItemsOneThousandParameter;
}

@maxItems(1000)
model MaxItemsOneThousandParameter is string[];

model PublishedParameter {
  /**
   * If specified, only return advisories that were published on a date or date range.
   * For more information on the syntax of the date range, see [Understanding the search syntax](https://docs.github.com/search-github/getting-started-with-searching-on-github/understanding-the-search-syntax#query-for-dates).
   */
  @query published?: string;
}
