defmodule Mix.RiakTasks do

  defmodule MemberStatus do
    use Mix.Task
    import RiakTasks

    @doc """
    riak-admin member-status
    """
    def run([name]) do
      sh "./#{name}2/bin/riak-admin member-status"
    end
  end

  defmodule AdminTest do
    use Mix.Task
    import RiakTasks

    @doc """
    riak-admin test
    """
    def run([name]) do
      num_nodes = conf!(name, :num_nodes)
      Enum.each 1..num_nodes, fn n ->
        sh "./#{name}#{n}/bin/riak-admin test"
      end
    end
  end

  defmodule AdminStatus do
    use Mix.Task
    import RiakTasks

    @doc """
    riak-admin status
    """
    def run([name]) do
      sh "./#{name}1/bin/riak-admin status"
    end
  end


  defmodule AdminRingStatus do
    use Mix.Task
    import RiakTasks

    @doc """
    riak-admin ring-status
    """
    def run([name]) do
      sh "./#{name}1/bin/riak-admin ring-status"
    end
  end

  defmodule AdminMapBucket do
    use Mix.Task
    import RiakTasks

    @doc """
    Sets up maps bucket-type
    """
    def run([name]) do
      sh "./#{name}1/bin/riak-admin bucket-type create maps '{\"props\":{\"datatype\":\"map\"}}'"
      sh "./#{name}1/bin/riak-admin bucket-type activate maps"
    end
  end

  defmodule AdminSetBucket do
    use Mix.Task
    import RiakTasks

    @doc """
    Sets up sets bucket-type
    Sets up maps bucket-type
    """
    def run([name]) do
      sh "./#{name}1/bin/riak-admin bucket-type create sets '{\"props\":{\"datatype\":\"set\"}}'"
      sh "./#{name}1/bin/riak-admin bucket-type activate sets"
    end
  end

  defmodule AdminCounterBucket do
    use Mix.Task
    import RiakTasks

    @doc """
    Sets up counters bucket-type
    """
    def run([name]) do
      sh "./#{name}1/bin/riak-admin bucket-type create counters '{\"props\":{\"datatype\":\"counter\"}}'"
      sh "./#{name}1/bin/riak-admin bucket-type activate counters"
    end
  end
end
