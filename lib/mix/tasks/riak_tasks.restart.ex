defmodule Mix.Tasks.RiakTasks.Restart do
  use Mix.Task

  @doc """
  Restarts all riak nodes
  """
  def run(args) do
    Mix.Tasks.RiakTasks.Stop.run(args)
    Mix.Tasks.RiakTasks.Start.run(args)
  end
end
