defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l) do
    ListOps.reduce(l, 0, fn (_,acc) -> acc + 1 end )
  end

  @spec reverse(list) :: list
  def reverse(l) do
    reverse(l, [])
  end

  def reverse([], reversed) do
    reversed
  end

  def reverse([h | t], reversed) do
    reverse(t, [h | reversed])
  end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    reverse( map(l, [], f) )
  end

  def map([], mapped, _) do
    mapped
  end

  def map([h | t], mapped, f) do
    map(t, [f.(h) | mapped], f)
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], f), do: []

  def filter([h | t], f) do
    if f.(h), do: [h | filter(t, f)], else: filter(t, f)
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, f) do
    acc
  end

  def reduce([h | []], acc, f) do
    f.(h, acc)
  end

  def reduce([h | t], acc, f) do
    reduce(t, f.(h, acc), f)
  end

  @spec append(list, list) :: list

  def append([], []) do
    []
  end

  def append(a, []) do
    a
  end

  def append([], b) do
    b
  end

  def append([h | t], b) do
    [h | append(t, b)]
  end

  @spec concat([[any]]) :: [any]
  def concat([]) do 
    []
  end

  def concat([h |t]) do
    append(h, concat(t))
  end
end
