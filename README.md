# Ruby, Omniauth, Facebook/AWS-Cognito Example

This is a demo project to show how to use AWS Cognito with a Ruby application.
It has drawn inspiration from a number of sources including:

* [Managing authentication in your Ruby on Rails 5 app with Auth0](https://auth0.com/blog/rails-5-with-auth0/)
* [How to Use Omniauth to Authenticate your Users](https://code.tutsplus.com/articles/how-to-use-omniauth-to-authenticate-your-users--net-22094)
* [OmniAuth Strategy for AWS Cognito in Ruby ](https://github.com/Sage/omniauth-cognito-idp)

## Ruby version

2.6.1 (The version installed on Mac OS X High Sierra)

## System dependencies

Everything should be in the Gemfile

## Running

First configure the .env file.  You'll need a Facebook Developer account and/or an AWS account (For setting up AWS Cognito).
Facebook is fairly easy to setup.  Register your app grab the App ID and App Secret from the Basic Settings page of your app
and place them next to the appropriate Facebook sections in the environment file.

Setting up AWS Cognito is a little more involved as you have to chase down the various variables from different places within
the AWS Cognito console.

You'll find the Pool ID for `COGNITO_USER_POOL_ID` at the top of the general settings of the console.

You'll find the Client ID for `GOGNITO_CLIENT_ID` under App Integration > App Client Settings at the top.

You'll find the User Pool Site for `GOGNITO_USER_POOL_SITE` under App Integration > Domain Name.  Also under
this section you'll find the AWS Region by taking the fixed part of the Amazon Cognito Domain (e.g. auth.eu-west-2.amazoncognito.com)
The `COGNITO_AWS_REGION` is the bit after `auth.` and before `.amazoncognito.com`.

You'll find the `COGNITO_CLIENT_ID` and `COGNITO_CLIENT_SECRET` under General Settings > App Clients.  The Client ID for `COGNITO_CLIENT_ID`
in the box under App client id.  Click the Show Details button to reveal the App client secrets box.  This matches `COGNITO_CLIENT_SECRET`.

With this information you should be able to populate the .env file example below:

```env
FACEBOOK_APP_ID=
FACEBOOK_APP_SECRET=
COGNITO_CLIENT_ID=
COGNITO_CLIENT_SECRET=
COGNITO_USER_POOL_SITE=
COGNITO_USER_POOL_ID=
COGNITO_AWS_REGION=
```

Once you have a populated .env file it should be as simple to get up and running with the following two commands:

```
bundle install
rails server
```

Navigate a web browser to [http://localhost:3000](http://localhost:3000/) and click your preferred method of auth 
(Cognito or Facebook).  Once you've successfully authenticated yourself you should be redirected to a dashboard page.
If you have a session and go back to the root you'll automatically be redirected to the dashboard.  You can log out using
the link on the dashboard, this will return you back to the home page.  If you try to manually go to the dashboard without
a valid authorisation or session you'll be redirected automatically back to the home page to login.

## Notes

This is just a basic example of using 3rd party auth with ruby and rails.

## License

This is distributed under the MIT License.