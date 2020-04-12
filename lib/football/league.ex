defmodule Football.League do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:league_id, :integer, []}
  schema "leagues" do
    field(:country, :string)
    field(:country_code, :string)
    field(:flag, :string)
    field(:logo, :string)
    field(:name, :string)
    field(:season, :integer)
    field(:season_end, :utc_datetime)
    field(:season_start, :utc_datetime)
    field(:standings, :integer)
    field(:type, :string)
    field(:is_crawled_team, :boolean)
    field(:is_top_league, :boolean)
    has_many(:teams, Football.Team, on_delete: :nothing)
    timestamps()
  end

  @doc false
  def changeset(league, attrs) do
    attrs =
      attrs
      |> Map.put("season_start", Timex.parse!(attrs["season_start"], "{YYYY}-{0M}-{0D}"))
      |> Map.put("season_end", Timex.parse!(attrs["season_end"], "{YYYY}-{0M}-{0D}"))

    league
    |> cast(attrs, [
      :country,
      :country_code,
      :flag,
      :logo,
      :name,
      :season_end,
      :season_start,
      :standings,
      :league_id,
      :season,
      :is_top_league,
      :type
    ])
    |> validate_required([:country, :name, :season_end, :season_start, :standings, :league_id])
  end

  @doc false
  def changeset_by_repo(league, attrs) do
    league
    |> cast(attrs, [
      :country,
      :country_code,
      :flag,
      :logo,
      :name,
      :season_end,
      :season_start,
      :standings,
      :league_id,
      :season,
      :is_top_league,
      :type
    ])
    |> validate_required([:country, :name, :season_end, :season_start, :standings, :league_id])
  end
end
