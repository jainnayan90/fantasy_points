defmodule FantasyPoints.Users.UserServer do
  @moduledoc """
  This module acts as a gen_server. It updates user stats.
  """

  use GenServer

  alias FantasyPoints.Users.UserAdapter

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

  @impl true
  def handle_info(:timeout, state) do
    stream =
      Task.async_stream(1..1_000_000, fn id ->
        id
        |> UserAdapter.get()
        |> case do
          nil ->
            :ok

          %_{id: ^id} = user ->
            UserAdapter.update(user, %{points: Enum.random(0..100)})
        end
      end)

    Stream.run(stream)

    min_number = Enum.random(0..100)
    state = %{state | min_number: min_number}
    {:noreply, state, @timeout}
  end
end
