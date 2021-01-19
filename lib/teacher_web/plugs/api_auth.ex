defmodule TeacherWeb.Plugs.ApiAuth do
  import Plug.Conn

  alias Teacher.Auth

  def init(_arts) do

  end

  def call(conn, _arts) do
    key = conn
      |> get_req_header("atuhorization")
      |> parse_key()

    if Auth.api_key_exists?(key) do
      conn
    else
      conn
      |> send_resp(:unauthorized, "Invalid API key")
      |> halt()
    end
  end

  defp parse_key([]), do: nil
  defp parse_key(["Apikey" <> key]), do: key

end
