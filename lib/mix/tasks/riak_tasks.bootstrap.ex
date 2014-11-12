defmodule Mix.Tasks.RiakTasks.Bootstrap do
  use Mix.Task

  def run(args) do
    Mix.Tasks.RiakTasks.Install.run(args)
    Mix.Tasks.RiakTasks.Start.run(args)
    Mix.Tasks.RiakTasks.Join.run(args)
  end
end
