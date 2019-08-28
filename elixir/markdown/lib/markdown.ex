defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(markdown) do
    markdown
    |> String.split("\n")
    |> Enum.map(&String.split/1)
    |> Enum.map(&parse_line/1)
    |> Enum.join()
    |> to_list()
  end

  defp parse_line(["#" <> _ | _] = line), do: to_header(line)
  defp parse_line(["*" | _] = line), do: to_list_item(line)
  defp parse_line(line), do: to_paragraph(line)

  defp to_header([head | tail]) do
    num =
      head
      |> String.length()
      |> to_string()

    text = Enum.join(tail, " ")
    "<h#{num}>" <> text <> "</h#{num}>"
  end

  defp to_list_item(list) do
    item =
      list
      |> Enum.slice(1..-1)
      |> style_line()

    "<li>#{item}</li>"
  end

  defp to_paragraph(text) do
    text = style_line(text)

    "<p>#{text}</p>"
  end

  defp style_line(text) do
    text
    |> Enum.map(&to_styling/1)
    |> Enum.join(" ")
  end

  defp to_styling(word) do
    word
    |> String.replace(~r/^__/, "<strong>")
    |> String.replace(~r/__$/, "</strong>")
    |> String.replace(~r/^_/, "<em>")
    |> String.replace(~r/_$/, "</em>")
  end

  defp to_list(list) do
    list
    |> String.replace("<li>", "<ul><li>", global: false)
    |> String.replace_suffix("</li>", "</li></ul>")
  end
end
