defmodule Football.Season do
  use Ecto.Schema
  import Ecto.Changeset

  schema "seasons" do
    field :type, :integer
    field :season_id, :integer
    timestamps()
  end

  @doc false
  def changeset(season, attrs) do
    attrs =
      Map.update!(attrs, :type, fn type ->
        {year, _} = Integer.parse(type)
        year
      end)

    season
    |> cast(attrs, [:type, :season_id])
    |> validate_required([:type])
  end
end
