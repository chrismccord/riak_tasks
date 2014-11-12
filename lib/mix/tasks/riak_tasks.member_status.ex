defmodule Mix.Tasks.RiakTasks.MemberStatus do
  use Mix.Task
  import RiakTasks

  @doc """
  riak-admin member-status
  """
  def run([name]) do
    sh "./#{name}2/bin/riak-admin member-status"
  end
end
