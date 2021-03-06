defmodule ExPlayground.Endpoint do
  use Phoenix.Endpoint, otp_app: :ex_playground

  socket "/socket", ExPlayground.UserSocket

  # Serve at "/" the given assets from "priv/static" directory
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/", from: :ex_playground, gzip: false,
    only: ~w(css images js fonts favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_ex_playground_key",
    signing_salt: "ZofTHwd4"

  plug ExPlayground.Router
end
