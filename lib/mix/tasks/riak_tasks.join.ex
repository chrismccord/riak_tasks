defmodule Mix.Tasks.RiakTasks.Join do
  use Mix.Task
  import RiakTasks

  @doc """
  Join riak nodes (only needed once)
  """
  def run([name]) do
    num_nodes = conf!(name, :num_nodes)
    host = conf!(name, 1, :host)
    Enum.each 2..num_nodes, fn n ->
      sh "./#{name}#{n}/bin/riak-admin join -f #{name}1@#{host}"
    end
  end
end
