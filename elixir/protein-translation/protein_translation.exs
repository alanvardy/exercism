defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    new_rna = recursive_rna(rna)

    cond do
      new_rna == :error -> {:error, "invalid RNA"}
      List.last(new_rna) == :error -> {:error, "invalid RNA"}
      true -> {:ok, new_rna}
    end
  end

  def recursive_rna(rna, result \\ [])

  def recursive_rna("", result) do
    result
  end

  def recursive_rna(rna, result) do
    codon =
      rna
      |> String.slice(0, 3)
      |> of_codon()

    case codon do
      {:ok, "STOP"} -> result
      {:ok, x} -> [x | recursive_rna(String.slice(rna, 3, 100), result)]
      {:error, _} -> [:error]
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    case codon do
      codon when codon in ["UGU", "UGC"] -> {:ok, "Cysteine"}
      codon when codon in ["UUA", "UUG"] -> {:ok, "Leucine"}
      codon when codon in ["UUU", "UUC"] -> {:ok, "Phenylalanine"}
      codon when codon in ["UAU", "UAC"] -> {:ok, "Tyrosine"}
      codon when codon in ["UCU", "UCA", "UCC", "UCG"] -> {:ok, "Serine"}
      "AUG" -> {:ok, "Methionine"}
      "UGG" -> {:ok, "Tryptophan"}
      codon when codon in ["UGA", "UAG", "UAA"] -> {:ok, "STOP"}
      _ -> {:error, "invalid codon"}
    end
  end
end
