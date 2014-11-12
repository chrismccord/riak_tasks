defmodule Mix.Tasks.RiakTasks.Stop do
  use Mix.Task
  import RiakTasks

  @doc """
  stop all riak nodes
  """
  def run([name]) do
    num_nodes = conf!(name, :num_nodes)
    Enum.each 1..num_nodes, fn n ->
      sh "ulimit -n 65536; ./#{name}#{n}/bin/riak stop"
    end
  end
end
