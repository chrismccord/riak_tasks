defmodule Mix.Tasks.RiakTasks.Destroy do
  use Mix.Task
  import RiakTasks

  @doc """
  Clear data from all riak nodes and destroy node directory
  """
  def run([name]) do
    Mix.Tasks.RiakTasks.Stop.run([name])
    num_nodes = conf!(name, :num_nodes)
    Enum.each 1..num_nodes, fn n ->
      sh "rm -rf #{name}#{n}"
    end
  end
end
