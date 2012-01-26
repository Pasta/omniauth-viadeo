# OmniAuth Viadeo

This gem contains the Viadeo strategy for OmniAuth.

## How To Use It

Usage is as per any other OmniAuth 1.0 strategy. So let's say you're using Rails, you need to add the strategy to your `Gemfile` along side omniauth:

    gem 'omniauth'
    gem 'omniauth-viadeo'

Of course if one or both of these are unreleased, you may have to pull them in directly from github e.g.:

    gem 'omniauth', :git => 'https://github.com/intridea/omniauth.git'
    gem 'omniauth-viadeo', :git => 'https://github.com/pasta/omniauth-viadeo.git'

Once these are in, you need to add the following to your `config/initializers/omniauth.rb`:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :viadeo, "consumer_key", "consumer_secret" 
    end

You will obviously have to put in your key and secret, which you get when you register your app with Viadeo.

Now just follow the README at: https://github.com/intridea/omniauth

## License

Copyright (c) 2012 by Vincent Coste

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
