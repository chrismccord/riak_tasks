defmodule Mix.Tasks.RiakTasks.Start do
  use Mix.Task
  import RiakTasks

  @doc """
  start all riak nodes
  """
  def run([name]) do
    num_nodes = conf!(name, :num_nodes)
    Enum.each 1..num_nodes, fn n ->
      sh "ulimit -n 65536; ./#{name}#{n}/bin/riak start"
    end
    IO.puts """
    =======================================
    Riak #{name} cluster started

    HTTP API: http://127.0.0.1:11098

    Admin UI: http://127.0.0.1:11098/admin
    =======================================
    """
  end
end
