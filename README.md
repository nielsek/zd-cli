### Demo

![demo](images/zd-cli-demo.webm)

### Features

* Search
* View browsing
* Ticket comment browsing
* Ticket comment updating
* Ticket status updating

### Requirements

* Ruby - do `bundle install`
* Peco - https://github.com/peco/peco/releases
* A Zendesk token - https://pil.zendesk.com/agent/admin/api/settings/tokens

### Config

Put content in `config.rb`:

    ENV['zd_url']='pil.zendesk.com'
    ENV['zd_user']='nk@pil.dk'
    ENV['zd_token']='FL4Fh3st'

### TODO

* Caching
* Ticket reassignment
* Attachments