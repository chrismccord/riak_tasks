defmodule RiakTasks do

  def conf!(name, :num_nodes) do
    case Application.get_env(:riak_tasks, String.to_atom(name)) do
      nodes when is_list(nodes) -> Enum.count(nodes)
      _ -> raise "No configuration found for '#{name}' cluster"
    end
  end
  def conf!(name, n, key) do
    case conf(name, n, key) do
      nil -> raise "No configuration found for '#{name}' cluster"
      val -> val
    end
  end
  def conf(name, n, key) do
    case Application.get_env(:riak_tasks, String.to_atom(name)) do
      nodes when is_list(nodes) -> Enum.at(nodes, n - 1) |> Dict.get(key)
      nil -> nil
    end
  end

  def riak_version, do: Application.get_all_env(:riak_tasks) |> Dict.fetch!(:riak_version)
  def riak_download_url, do: Application.get_all_env(:riak_tasks) |> Dict.fetch!(:riak_download_url)
  def num_nodes, do: Application.get_all_env(:riak_tasks) |> Dict.fetch!(:num_nodes)
  def ring_size, do: Application.get_all_env(:riak_tasks) |> Dict.fetch!(:ring_size)

  def sh(cmd) do
    IO.puts ">> #{cmd}"
    sh_silent(cmd)
  end
  def sh_silent(cmd) do
    cmd |> String.to_char_list |> :os.cmd |> case do
      []     -> :noop
      result -> IO.puts(result)
    end
  end
end
