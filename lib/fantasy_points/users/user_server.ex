defmodule FantasyPoints.Users.UserServer do
  @moduledoc """
  This module acts as a gen_server. It updates user stats.
  """
  alias DBConnection.Task

  use GenServer

  @initial_state %{min_number: Enum.random(0..100), timestamp: nil}
  @timeout 60_000

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  @spec init(term()) :: {:ok, map(), non_neg_integer()}
  def init(_opts) do
    {:ok, @initial_state, @timeout}
  end

  # @impl true
  # def handle_info(:timeout, state) do

  #   min_number = Enum.random(0..100)
  #   state = %{state | min_number: min_number}
  #   {:noreply, state, @timeout}
  # end

  # defp update_user_points() do

  # end
end
