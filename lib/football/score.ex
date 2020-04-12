defmodule Football.Score do
  alias Football.Fixture
  use Ecto.Schema
  import Ecto.Changeset

  schema "scores" do
    field :extratime, :string
    field :fulltime, :string
    field :halftime, :string
    field :penalty, :string
    belongs_to(:fixture, Fixture)
    timestamps()
  end

  @doc false
  def changeset(score, attrs) do
    score
    |> cast(attrs, [:halftime, :fulltime, :extratime, :penalty, :fixture_id])
  end
end
