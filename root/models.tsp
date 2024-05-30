import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using TypeSpec.Rest;

namespace GitHub;

model RootModel {
  current_user_url: url;
  current_user_authorizations_html_url: url;
  authorizations_url: url;
  code_search_url: url;
  commit_search_url: url;
  emails_url: url;
  emojis_url: url;
  events_url: url;
  feeds_url: url;
  followers_url: url;
  following_url: url;
  gists_url: url;
  hub_url: url;
  issue_search_url: url;
  issues_url: url;
  keys_url: url;
  notifications_url: url;
  organization_url: url;
  organization_repositories_url: url;
  organization_teams_url: url;
  public_gists_url: url;
  rate_limit_url: url;
  repository_url: url;
  repository_search_url: url;
  current_user_repositories_url: url;
  starred_url: url;
  starred_gists_url: url;
  topic_search_url: url;
  user_url: url;
  user_organizations_url: url;
  user_repositories_url: url;
  user_search_url: url;
}
