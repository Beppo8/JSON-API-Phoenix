defmodule TeacherWeb.Api.AlbumController do
  use TeacherWeb, :controller

  alias Teacher.Recordings

  def index(conn, _params) do
    albums = Recordings.list_albums()
    render(conn, "index.json-api", data: albums)
  end

  def show(conn, %{"id" => id}) do
    album = Reocodings.get_album!(id)
    render(conn, "show.json-api", data: album)
  end


end
