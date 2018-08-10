require "./server"

Lucky::Session::Store.configure do
  settings.key = "bitcoin_wallet"
  settings.secret = Lucky::Server.settings.secret_key_base
end
