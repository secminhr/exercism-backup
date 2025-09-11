defmodule Ledger do
  @doc """
  Format the given entries given a currency and locale
  """
  @type currency :: :usd | :eur
  @type locale :: :en_US | :nl_NL
  @type entry :: %{amount_in_cents: integer(), date: Date.t(), description: String.t()}

  @us_header "Date       | Description               | Change       \n"
  @nl_header "Datum      | Omschrijving              | Verandering  \n"

  @header %{en_US: @us_header, nl_NL: @nl_header}
  @currency_symbol %{usd: "$", eur: "€"}
  @k_splitter %{en_US: ",", nl_NL: "."}
  @decimal_point %{en_US: ".", nl_NL: ","}
  @description_width 25
  @amount_width 14

  @spec format_entries(currency(), locale(), list(entry())) :: String.t()
  def format_entries(currency, locale, entries) do
    header = @header[locale]

    if entries == [] do
      header
    else
      # utilize the stable property of Enum.sort, 
      # the priority of each fields in entry can be represented by separated Enum.sort, 
      # the later the field is used, the higher priority it has
      entries =
        Enum.sort(entries, fn a, b -> a.amount_in_cents <= b.amount_in_cents end) 
          |> Enum.sort(fn a, b -> a.description > b.description end)
          |> Enum.sort(fn a, b -> a.date.day < b.date.day end)
          |> Enum.map(fn entry -> format_entry(currency, locale, entry) end)
          |> Enum.join("\n")

      header <> entries <> "\n"
    end
  end

  defp format_entry(currency, locale, entry) do
    [ format_date(locale, entry.date), 
      format_description(entry.description),
      format_amount(locale, currency, entry.amount_in_cents) ] |> Enum.join("|")
  end

  defp format_date(locale, date) do
    year = date.year |> to_string()
    month = date.month |> to_string() |> String.pad_leading(2, "0")
    day = date.day |> to_string() |> String.pad_leading(2, "0")

    if locale == :en_US, do: "#{month}/#{day}/#{year} ", else: "#{day}-#{month}-#{year} "
  end

  defp format_amount(locale, currency, amount_in_cents) do
    number = format_amount_number(locale, amount_in_cents)
      
    currency_symbol = @currency_symbol[currency]   

    if amount_in_cents >= 0 do
      if locale == :en_US do
        "  #{currency_symbol}#{number} "
      else
        " #{currency_symbol} #{number} "
      end
    else
      if locale == :en_US do
        " (#{currency_symbol}#{number})"
      else
        " #{currency_symbol} -#{number} "
      end
    end
    |> String.pad_leading(@amount_width, " ")
  end

  defp format_amount_number(locale, amount_in_cents) do
    digits = Integer.digits(abs(amount_in_cents))
    {whole_digits, decimal_digits} = Enum.split(digits, -2)
    {kilo_digits, under_kilo_digits} = Enum.split(whole_digits, -3)
    
    decimal = Enum.join(decimal_digits) |> String.pad_leading(2, "0")

    under_kilo = Enum.join(under_kilo_digits) |> String.trim()
    under_kilo = if under_kilo == "", do: "0", else: under_kilo
    
    kilo = Enum.join(kilo_digits) |> String.trim()

    whole = if kilo == "", do: under_kilo, else: kilo <> @k_splitter[locale] <> under_kilo
    whole <> @decimal_point[locale] <> decimal
  end

  defp format_description(description) do
    if description |> String.length() >= @description_width do
      " " <> String.slice(description, 0, @description_width - 3) <> "... "
    else
      " " <> String.pad_trailing(description, @description_width, " ") <> " "
    end
  end
end
