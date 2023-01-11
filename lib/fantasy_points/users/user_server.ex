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
  def handle_call(:get_users, _from, state) do
    users = UserAdapter.get_users(state.min_number)
    new_state = %{state | timestamp: DateTime.utc_now()}
    {:reply, {:ok, {state.timestamp, users}}, new_state, @timeout}
  end

  @impl true
  def handle_info(:timeout, state) do
    Task.async(fn -> update_user_points() end)

    min_number = Enum.random(0..100)
    state = %{state | min_number: min_number}
    {:noreply, state, @timeout}
  end

  defp update_user_points() do
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
  end
end
