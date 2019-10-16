defmodule StorexWeb.Helpers.PriceFormatter do
  def format_price(%Decimal{} = price) do
    "$ #{price}"
  end
end
