defmodule Football.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :comments, :string
    field :detail, :string
    field :elapsed, :integer
    field :elapsed_plus, :integer
    field :type, :string
    field :team_id, :id
    field :player_id, :id
    field :assist_id, :id

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:elapsed, :elapsed_plus, :type, :detail, :comments])
    |> validate_required([:elapsed, :elapsed_plus, :type, :detail, :comments])
  end
end
