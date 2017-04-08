Requirements:

* Ruby - do `bundle install`
* Peco - https://github.com/peco/peco/releases
* A Zendesk token - https://pil.zendesk.com/agent/admin/api/settings/tokens

Put content in `config.rb`:

    ENV['zd_url']='pil.zendesk.com'
    ENV['zd_user']='nk@pil.dk'
    ENV['zd_token']='FL4Fh3st'

Demo:

![demo](images/zd-cli-demo.webm)
