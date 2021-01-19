defmodule TeacherWeb.Plugs.CheckAuth do
  import Plug.Conn
  import Phoenix.Controller
  alias TeacherWeb.Router.Helpers, as: Routes

  def init(_args) do
  end

  def call(conn, _args) do
  current_user = conn.assigns[:current_user]
  params_user_id = conn.params["user_id"] |> String.to_integer()

  if current_user && params_user_id == current_user.id do
    conn
  else
    conn
    |> put_flash(:error, "Unable to access that page")
    |> redirect(to: Routes.album_path(conn, :index))
    |> halt()
  end

  end
end
