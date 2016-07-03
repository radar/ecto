Store.Repo.delete_all(Store.Product)

[
  %Store.Product{
    name: "A shoe",
  },
  %Store.Product{
    name: "A shirt",
  }
] |> Enum.each(&Store.Repo.insert!/1)
