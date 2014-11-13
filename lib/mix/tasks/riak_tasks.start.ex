defmodule Mix.Tasks.RiakTasks.Start do
  use Mix.Task
  import RiakTasks

  @doc """
  start all riak nodes
  """
  def run([name]) do
    num_nodes = conf!(name, :num_nodes)
    Enum.each 1..num_nodes, fn n ->
      host        = conf!(name, n, :host)
      proto_port  = conf!(name, n, :protobuf_port)
      http_port   = conf!(name, n, :http_port)
      admin       = conf(name, n, :admin)

      sh "ulimit -n 65536; ./#{name}#{n}/bin/riak start"
      IO.puts "    protobuf #{host}:#{proto_port}"
      if admin do
        IO.puts "    admin    http://#{host}:#{http_port}/admin"
      end

    end
    IO.puts """
    =======================================
    Riak #{name} cluster started
    =======================================
    """
  end
end
