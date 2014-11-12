defmodule Mix.Tasks.RiakTasks.Ping do
  use Mix.Task
  import RiakTasks

  @doc """
  Pings all riak nodes
  """
  def run([name]) do
    num_nodes = conf!(name, :num_nodes)
    Enum.each 1..num_nodes, fn n ->
      sh "./#{name}#{n}/bin/riak ping"
    end
  end
end
