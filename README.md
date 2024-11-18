![](https://i.imgur.com/OhtkhbJ.png)

# SSOReady-Ruby: SAML & SCIM for Ruby

[![](https://img.shields.io/gem/v/ssoready)](https://rubygems.org/gems/ssoready)

`ssoready` is a Ruby SDK for the [SSOReady](https://ssoready.com) API.

SSOReady is a set of open-source dev tools for implementing Enterprise SSO. You
can use SSOReady to add SAML and SCIM support to your product this afternoon.

For example applications built using SSOReady-Ruby, check out:

- [SSOReady Example App: Ruby + Sinatra with SAML](https://github.com/ssoready/ssoready-example-app-ruby-sinatra-saml)

## Installation

Add this dependency to your project's Gemfile:

```bash
gem install ssoready
# or
bundle add ssoready
```

## Usage

This section provides a high-level overview of how SSOReady works, and how it's
possible to implement SAML and SCIM in just an afternoon. For a more thorough
introduction, visit the [SAML
quickstart](https://ssoready.com/docs/saml/saml-quickstart) or the [SCIM
quickstart](https://ssoready.com/docs/scim/scim-quickstart).

The first thing you'll do is create a SSOReady client instance:

```rb
require "ssoready"

ssoready = SSOReady::Client.new # loads your API key from the env var SSOREADY_API_KEY
```

### SAML in two lines of code

SAML (aka "Enterprise SSO") consists of two steps: an _initiation_ step where
you redirect your users to their corporate identity provider, and a _handling_
step where you log them in once you know who they are.

To initiate logins, you'll use SSOReady's [Get SAML Redirect
URL](https://ssoready.com/docs/api-reference/saml/get-saml-redirect-url)
endpoint:

```rb
# this is how you implement a "Sign in with SSO" button
redirect_url = ssoready.saml.get_saml_redirect_url(
    # the ID of the organization/workspace/team (whatever you call it)
    # you want to log the user into
    organization_external_id: "..."
).redirect_url

# redirect the user to `redirect_url`...
```

You can use whatever your preferred ID is for organizations (you might call them
"workspaces" or "teams") as your `organization_external_id`. You configure those
IDs inside SSOReady, and SSOReady handles keeping track of that organization's
SAML and SCIM settings.

To handle logins, you'll use SSOReady's [Redeem SAML Access
Code](https://ssoready.com/docs/api-reference/saml/redeem-saml-access-code) endpoint:

```rb
# this goes in your handler for POST /ssoready-callback
redeem_result = ssoready.saml.redeem_saml_access_code(saml_access_code: "saml_access_code_...")

email = redeem_result.email
organization_external_id = redeem_result.organization_external_id

# log the user in as `email` inside `organizationExternalId`...
```

You configure the URL for your `/ssoready-callback` endpoint in SSOReady.

### SCIM in one line of code

SCIM (aka "Enterprise directory sync") is basically a way for you to get a list
of your customer's employees offline.

To get a customer's employees, you'll use SSOReady's [List SCIM
Users](https://ssoready.com/docs/api-reference/scim/list-scim-users) endpoint:

```rb
list_scim_users_response = ssoready.scim.list_scim_users(
    organization_external_id="my_custom_external_id"
)

# create users from each scim user
list_scim_users_response.scim_users.each do |scim_user|
    # every scim_user has an id, email, attributes, and deleted
end
```

## Contributing

Issues and PRs are more than welcome. Be advised that this library is largely
autogenerated from [`ssoready/docs`](https://github.com/ssoready/docs). Most
code changes ultimately need to be made there, not on this repo.
