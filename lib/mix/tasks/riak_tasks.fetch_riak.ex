defmodule Mix.Tasks.RiakTasks.FetchRiak do
  use Mix.Task
  import RiakTasks

  @doc """
  Fetches precompiled Riak
  """
  def run(_) do
    unless File.exists? "riak-#{riak_version}" do
      sh "curl -L #{riak_download_url} | tar xz -"
    end
  end
end
