defmodule BankAccount do
  use Agent

  @moduledoc """
  A bank account that supports access from multiple processes.
  """

  @typedoc """
  An account handle.
  """
  @opaque account :: pid

  @doc """
  Open the bank. Makes the account available.
  """
  @spec open_bank() :: account
  def open_bank() do
    {:ok, pid} = Agent.start_link(fn -> 0 end)

    pid
  end

  @doc """
  Close the bank. Makes the account unavailable.
  """
  @spec close_bank(account) :: none
  def close_bank(account) do
    Agent.update(account, fn _state -> :closed end)
  end

  @doc """
  Get the account's balance.
  """
  @spec balance(account) :: integer
  def balance(account) do
    response = Agent.get(account, fn state -> state end)

    case response do
      :closed -> {:error, :account_closed}
      _ -> response
    end
  end

  @doc """
  Update the account's balance by adding the given amount which may be negative.
  """
  @spec update(account, integer) :: any
  def update(account, amount) do
    cond do
      closed?(account) -> {:error, :account_closed}
      true -> Agent.update(account, &(&1 + amount))
    end
  end

  defp closed?(account) do
    Agent.get(account, fn state -> state end) == :closed
  end
end
