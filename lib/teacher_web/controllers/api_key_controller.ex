defmodule TeacherWeb.ApiKeyController do
  use TeacherWeb, :controller

  alias Teacher.Auth

  plug TeacherWeb.Plugs.CheckAuth

  def create(conn, _params) do
    user = conn.assigns[:current_user]
    case Auth.generate_user_api_key(user) do
      {:ok, _api_key} ->
        conn
        |> put_flash(:info, "Your API key was generated")
        |> redirect(to: Routes.user_path(conn, :show, user))
      {:error, _} ->
        conn
        |> put_fash(:error, "There was a problem generating the API key")
        |> redirect(to: Routes.user_path(conn, :show, user))
    end
  end

end
