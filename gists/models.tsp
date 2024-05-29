import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

using TypeSpec.Http;
using TypeSpec.OpenAPI;
using TypeSpec.Rest;

namespace GitHub;

/** The since query parameter. */
model SinceParameter {
  /**
   * Only show results that were last updated after the given time. This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: `YYYY-MM-DDTHH:MM:SSZ`.
   */
  @query since?: utcDateTime;
}

/** The per page parameter. */
model PerPageParameter {
  /**
   * The number of results per page (max 100). For more information, see [Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api).
   */
  @query per_page?: int32 = 30;
}

/** The page query parameter. */
model PageParameter {
  /**
   * The page number of the results to fetch. For more information, see [Using pagination in the REST API](https://docs.github.com/rest/using-the-rest-api/using-pagination-in-the-rest-api).
   */
  @query page?: int32 = 1;
}

model LinkResponseHeader {
  @header link: string;
}

model LocationResponseHeader {
  @header Location: url;
}

/** Base Gist */
model BaseGist {
  url: url;
  forks_url: url;
  commits_url: url;
  @key
  id: string;
  node_id: string;
  git_pull_url: url;
  git_push_url: url;
  html_url: url;
  files: Record<GistFile>;
  public: boolean;
  created_at: utcDateTime;
  updated_at: utcDateTime;
  description: string;
  comments: int32;
  user?: SimpleUser;
  comments_url: url;
  owner: SimpleUser;
  truncated: boolean;
  forks: unknown[];
  history: unknown[];
}

model GistFile {
  filename: string;
  type: string;
  language: string;
  raw_url: url;
  size: int32;
}

/** Simple User */
model SimpleUser {
  name?: string;
  email?: string;
  login: string;
  @key
  id: int32;
  node_id: string;
  avatar_url: url;
  gravatar_id?: string;
  url: url;
  html_url: url;
  followers_url: url;
  following_url: url;
  gists_url: url;
  starred_url: url;
  subscriptions_url: url;
  organizations_url: url;
  repos_url: url;
  events_url: url;
  received_events_url: url;
  type: string;
  site_admin: boolean;
  starred_at: utcDateTime;
}

model CreateGistRequest {
  /** Description of the gist */
  description?: string;
  /** Flag indicating whether the gist is public */
  public?: boolean = false;
  /** Names and content for the files that make up the gist */
  files: Record<GistContent>;
}

model GistContent {
  content: string;
}
