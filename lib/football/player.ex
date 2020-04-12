defmodule Football.Player do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:player_id, :integer, []}
  schema "players" do
    field(:age, :integer)
    field(:birth_country, :string)
    field(:birth_date, :utc_datetime)
    field(:birth_place, :string)
    field(:captain, :integer)
    field(:firstname, :string)
    field(:height, :string)
    field(:injured, :string)
    field(:lastname, :string)
    field(:nationality, :string)
    field(:number, :integer)
    field(:player_name, :string)
    field(:position, :string)
    field(:rating, :string)
    field(:weight, :string)
    field(:shots, :map)
    field(:goals, :map)
    field(:passes, :map)
    field(:tackles, :map)
    field(:duels, :map)
    field(:dribbles, :map)
    field(:fouls, :map)
    field(:cards, :map)
    field(:penalty, :map)
    field(:games, :map)
    field(:substitutes, :map)

    belongs_to(:team, Team, references: :team_id)

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    attrs =
      if(not is_nil(attrs["birth_date"])) do
        attrs
        |> Map.put("birth_date", String.replace(attrs["birth_date"], " ", ""))
        |> Map.put("birth_date", Timex.parse!(attrs["birth_date"], "{0D}/{0M}/{YYYY}"))
      else
        attrs
      end

    player
    |> cast(attrs, [
      :player_id,
      :player_name,
      :firstname,
      :lastname,
      :number,
      :position,
      :age,
      :birth_date,
      :birth_place,
      :birth_country,
      :nationality,
      :height,
      :weight,
      :injured,
      :rating,
      :captain,
      :shots,
      :goals,
      :passes,
      :tackles,
      :duels,
      :dribbles,
      :fouls,
      :cards,
      :penalty,
      :games,
      :substitutes,
      :team_id
    ])
    |> validate_required([
      :player_id,
      :player_name,
      :firstname,
      :lastname,
      :team_id
    ])
  end
end
