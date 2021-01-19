defmodule TeacherWeb.Api.AlbumController do
  use TeacherWeb, :controller

  alias Teacher.Recordings

  def index(conn, params) do
    page_num = get_in(params, ["page", "number"])
    page_size = get_in(params, ["page", "size"])

    albums = Recordings.paginate_albums(%{page: page_num, page_size: page_size})
    render(conn, "index.json-api", data: albums)
  end

  def show(conn, %{"id" => id}) do
    album = Reocodings.get_album!(id)
    render(conn, "show.json-api", data: album)
  end


end
