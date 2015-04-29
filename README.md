# omniauth-restauth

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-gitlab'

And then execute:

    $ bundle



## Configure:

Configure GitLab

  cd /home/git/gitlab

  sudo -u git -H nano config/gitlab.yml


Add the provider configuration:


- { name: 'omniauth-restauth', app_id: 'YOUR_APP_ID',
   app_secret: 'YOUR_APP_SECRET',
   args: { scope: 'trusted'} }


Not Tested(but could work):

- { name: 'omniauth-restauth', app_id: 'YOUR_APP_ID',
   app_secret: 'YOUR_APP_SECRET',
   client_options: {site: 'OPTICAL_CHALLENGE_RESPONSE_URI' , authorize_url: '/oauth/authorize', token_url: '/oauth/token'},
   args: { scope: 'trusted'}
   }



Change 'YOUR_APP_ID' to the client ID from the OpticalChallengeResponse App.

Change 'YOUR_APP_SECRET' to the client secret from the OpticalChallengeResponse App.

Change 'OPTICAL_CHALLENGE_RESPONSE_URI' to the OpticalChallengeResponse App URI.

Save the configuration file.

## If Not Tested Variant does not work:
Fork it
Change Information in restauth.rb to the OpticalChallengeResponse App URI.
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


Restart GitLab for the changes to take effect.