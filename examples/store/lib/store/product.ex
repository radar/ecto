defmodule Store.Product do
  use Ecto.Schema

  schema "products" do
    field :name, :string
    field :description, :string
  end
end
