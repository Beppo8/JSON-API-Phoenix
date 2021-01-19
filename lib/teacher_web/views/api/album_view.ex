defmodule TeacherWeb.Api.AlbumView do
  use TeacherWeb, :view
  use JaSeriealizer.PhoenixView

  attributes [:title, :aritst, :year, :preview]

  has_one :category,
    serializer: TeacherWeb.Api.CategoryView
    include: true,
    identifiers: :when_included

    def preview(album, _conn) do
      String.slice(album.summary, 0..100) <> ""
    end

end
