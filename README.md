Run `bundle install`

Put content in `config.rb`:

    ENV['zd_url']='pil.zendesk.com'
    ENV['zd_user']='nk@pil.dk'
    ENV['zd_token']='FL4Fh3st'

Use all the things!

    % ./zd-search.rb flaf
    [#362453] test
    [#349738] flaf.dk suspenderet/suspended
    [#347508] REDEL flaf.dk 2/2
    [#347507] REDEL flaf.dk 2/2
    [#355202] Faktura
    [#352152] Firmafon betaling - fakturanr. 31511644
    [#347251] Faktura 5708489 (PIL1-DK)
    [#347506] Flytning til nye navneservere godkendt
    [#347503] Anmodning om flytning til nye navneservere
    [#368359] attach test
