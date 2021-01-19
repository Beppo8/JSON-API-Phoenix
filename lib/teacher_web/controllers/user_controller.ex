defmodule TeacherWeb.UserController do
  use TeacherWeb, :controller

  alias Teacher.Auth

  def show(conn, %{"id" => id}) do
    user = id
      |> Auth.get_user!()
      |> Auth.preload_api_key()
    render(conn, "show.html", user: user)
  end

end
