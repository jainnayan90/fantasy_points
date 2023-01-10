defmodule FantasyPoints.UserInteractor do
  @moduledoc """
  This module acts as an interface for user operations.
  """

  def get_users() do
    try do
      GenServer.call(FantasyPoints.Users.UserServer, :get_users)
    catch
      :exit, _error -> {:error, :gen_server_call_error}
    end
  end
end
