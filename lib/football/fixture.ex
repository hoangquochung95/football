defmodule Football.Fixture do
  alias Football.League
  alias Football.Team
  alias Football.Repo
  alias Football.Score
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:fixture_id, :integer, []}
  schema "fixtures" do
    field(:elapsed, :integer)
    field(:event_date, :naive_datetime)
    field(:event_timestamp, :integer)
    field(:firstHalfStart, :integer)
    field(:goalsAwayTeam, :integer)
    field(:goalsHomeTeam, :integer)
    field(:referee, :string)
    field(:round, :string)
    field(:secondHalfStart, :integer)
    field(:status, :string)
    field(:statusShort, :string)
    field(:venue, :string)
    belongs_to(:homeTeam, Team, references: :team_id)
    belongs_to(:awayTeam, Team, references: :team_id)
    belongs_to(:league, League, references: :league_id, foreign_key: :league_id)
    has_one(:score, Score, foreign_key: :fixture_id, on_replace: :update)
    timestamps()
  end

  @doc false
  def changeset(fixture, attrs) do
    fixture
    |> Map.put(:homeTeam_id, attrs["homeTeam"]["team_id"])
    |> Map.put(:awayTeam_id, attrs["awayTeam"]["team_id"])
    |> Repo.preload([:league, :homeTeam, :awayTeam, :score])
    |> cast(attrs, [
      :fixture_id,
      :event_date,
      :event_timestamp,
      :firstHalfStart,
      :secondHalfStart,
      :round,
      :status,
      :statusShort,
      :elapsed,
      :venue,
      :referee,
      :goalsHomeTeam,
      :goalsAwayTeam,
      :league_id,
      :homeTeam_id,
      :awayTeam_id
    ])
    |> foreign_key_constraint(:homeTeam_id, name: :fixtures_homeTeam_fkey)
    |> foreign_key_constraint(:awayTeam_id, name: :fixtures_awayTeam_fkey)
    |> cast_assoc(:score)
    |> validate_required([
      :fixture_id,
      :event_date,
      :event_timestamp,
      :round,
      :status,
      :statusShort,
      :elapsed,
      :venue
    ])
  end
end
