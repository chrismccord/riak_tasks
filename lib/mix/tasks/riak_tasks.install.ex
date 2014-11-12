defmodule Mix.Tasks.RiakTasks.Install do
  use Mix.Task

  @doc """
  Fetches precompiled Riak and copies to node directories
  """
  def run(args) do
    Mix.Tasks.RiakTasks.FetchRiak.run(args)
    Mix.Tasks.RiakTasks.CopyRiak.run(args)
  end
end
