defmodule Mix.Tasks.RiakTasks.CopyRiak do
  use Mix.Task
  import RiakTasks

  @doc """
  Copy Riak to node dirs
  """
  def run([name]) do
    num_nodes = conf!(name, :num_nodes)
    Enum.each 1..num_nodes, fn n ->
      http_port     = conf!(name, n, :http_port)
      protobuf_port = conf!(name, n, :protobuf_port)
      handoff_port  = conf!(name, n, :handoff_port)
      solr_port     = conf!(name, n, :solr_port)
      jmx_port      = conf!(name, n, :jmx_port)

      sh "cp -nr riak-#{riak_version}/ #{name}#{n}"

      sh_silent "sed -i '' 's/distributed_cookie = riak/distributed_cookie = #{name}/' #{name}#{n}/etc/riak.conf"
      sh_silent "sed -i '' 's/riak@127.0.0.1/#{name}#{n}@127.0.0.1/' #{name}#{n}/etc/riak.conf"
      sh_silent "sed -i '' 's/127.0.0.1:8098/127.0.0.1:#{http_port}/' #{name}#{n}/etc/riak.conf"
      sh_silent "sed -i '' 's/127.0.0.1:8087/127.0.0.1:#{protobuf_port}/' #{name}#{n}/etc/riak.conf"
      sh_silent "echo 'handoff.port = #{handoff_port}' >> #{name}#{n}/etc/riak.conf"
      sh_silent "echo 'ring_size = #{ring_size}' >> #{name}#{n}/etc/riak.conf"
      sh_silent "sed -i '' 's/search.solr.port = 8093/search.solr.port = #{solr_port}/' #{name}#{n}/etc/riak.conf"
      sh_silent "sed -i '' 's/search.solr.jmx_port = 8985/search.solr.jmx_port = #{jmx_port}/' #{name}#{n}/etc/riak.conf"
      sh_silent "sed -i '' 's/search = off/search = on/' #{name}#{n}/etc/riak.conf"
    end
  end
end
