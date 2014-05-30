# OmniAuth Dribbble

This is an OmniAuth strategy for authenticating with Dribbble. To
use it, you'll need to register for an OAuth2 Client ID and Secret
on your [Dirbbble Applications Page](https://dribbble.com/account/applications).

## Basic Usage

    use OmniAuth::Builder do
      provider :dribbble, ENV['DRIBBLE_CLIENT_KEY'], ENV['DRIBBBLE_CLIENT_SECRET']
    end

## Scopes

Dribbble API v1 lets you set scopes to provide granular access. `public` is the default scope:

    use OmniAuth::Builder do
      provider :dribbble, ENV['DRIBBLE_CLIENT_KEY'], ENV['DRIBBBLE_CLIENT_SECRET'], scope: 'public write'
    end

More info on [Scopes](https://github.com/dribbble/api-documentation/blob/master/content/v1/oauth.md#scopes).
