defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, fn x -> each_to_rna(x) end)
  end

  def each_to_rna(dna) do
    case dna do
      71 -> 67
      67 -> 71
      84 -> 65
      65 -> 85
    end
  end
end
