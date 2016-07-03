# Ecto Querying

This guide covers querying databases with Ecto. 

Querying in Ecto works by building a query and then passing that query to a repository (or "repo" for short). The repository then runs that query on the database it is configured to speak to, and a result is returned.

Here's an example query:

```elixir
Store.Product |> Ecto.Query.first |> Store.Repo.one
```

This takes the `Store.Product` schema, builds a query to fetch the first record, and then asks the repo for only one result from that query.

## Example project

## Retrieving records

### First

Retrieve the first record from a schema's table with the combination of `Ecto.Query.first/1` and `Repo.one/2`:

```elixir
Store.Product |> Ecto.Query.first |> Store.Repo.one
```

### Last

Retrieve the last record from a schema's table with the combination of `Ecto.Query.last/1` and `Repo.one/2`:

```elixir
Store.Product |> Ecto.Query.last |> Store.Repo.one
```

### All

Retrieve all records from a schema's table by using `Repo.all/1`:

```elixir
Store.Repo.all(Store.Product)
```

### By primary key

To retrieve a record by its primary key, use `Repo.get/2`:

```
Repo.get(Store.Product, 42)
```

## Query Building

Ecto querying allows two ways of compiling queries, to allow for flexibility in the construction of Ecto queries. The first is function chaining, like this:

```
Store.Product 
  |> Ecto.Query.where(category_id: 1, colour: "red")
  |> Ecto.Query.limit(100)
```

The second is by using `Ecto.Query.from`:

```elixir
Ecto.Query.from(
  p in Store.Product,
  where: [category_id: 1, colour: "red"],
  limit: 100
)
```

Both ways demonstrated here build the same query. The second syntax is a convenience macro which is used to build queries using a keyword list syntax.

If the `Ecto.Query` module has been imported, then you can simply write:

```
Store.Product 
  |> where(category_id: 1, colour: "red")
  |> limit(100)
```

Or:

```elixir
from(
  p in Store.Product,
  where: [category_id: 1, colour: "red"],
  limit: 100
)
```

### Select

You can perform a `SELECT` where by using the `select` function:

```elixir
Store.Product |> Ecto.Query.select([:name])
```

Rather than returning a struct based on the `Store.Product` schema, the fields will be returned in a list of tuples:

```elixir
[{"A shoe"}, {"A shirt"}]
```

The values can be returned as a map if this syntax is used instead:

```elixir
Store.Product |> Ecto.Query.select([p], %{ "name" => p.name })
```

This will return results like this:

```elixir
[%{"name" => "A shoe"}, %{"name" => "A shirt"}]
```



### Where

You can perform a `WHERE` query by using the `where` function:

```elixir
Store.Product 
  |> Ecto.Query.where(colour: "red")
```

You can query multiple fields by specifying them like this:

```elixir
Store.Product
  |> Ecto.Query.where(category_id: 1, colour: "red")
```





