defmodule Football.Team do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:team_id, :integer, []}
  schema "teams" do
    field :code, :string
    field :country, :string
    field :founded, :integer
    field :is_national, :boolean, default: false
    field :logo, :string
    field :name, :string
    field :venue_address, :string
    field :venue_capacity, :integer
    field :venue_city, :string
    field :venue_name, :string
    field :venue_surface, :string
    belongs_to :league, Football.League

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [
      :team_id,
      :name,
      :code,
      :logo,
      :country,
      :is_national,
      :founded,
      :venue_name,
      :venue_surface,
      :venue_address,
      :venue_city,
      :venue_capacity,
      :league_id
    ])
    |> validate_required([:team_id, :league_id])
  end

  def read_changeset(team, attrs) do
    team
    |> cast(attrs, [
      :team_id,
      :name,
      :code,
      :logo,
      :country,
      :is_national,
      :founded,
      :venue_name,
      :venue_surface,
      :venue_address,
      :venue_city,
      :venue_capacity,
      :league_id
    ])
  end
end
