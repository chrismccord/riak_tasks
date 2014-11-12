# RiakTasks

> Simple riak cluster bootstrap and management for devand test environments

Originally ported from https://github.com/cheeseplus/2.0-riak-dev-cluster

## Requirements

- Elixir 1.0+
- OSX (OSX only for now, but other environment can be supported by pointing the `riak_download_url` at a precompiled package specific to your platform)

## Usage

  1. Clone the repo
  2. Define  your clusters in `config.exs`. Default `dev` and `test` clusters are provided for easy customization.
  3. Create a cluster!

```bash
☁🚀 ☁ › mix riak_tasks.bootstrap dev
>> cp -nr riak-2.0.2/ dev1
>> cp -nr riak-2.0.2/ dev2
>> cp -nr riak-2.0.2/ dev3
>> ulimit -n 65536; ./dev1/bin/riak start
>> ulimit -n 65536; ./dev2/bin/riak start
>> ulimit -n 65536; ./dev3/bin/riak start
=======================================
Riak dev cluster started

HTTP API: http://127.0.0.1:11098

Admin UI: http://127.0.0.1:11098/admin
=======================================

>> ./dev2/bin/riak-admin join -f dev1@127.0.0.1
Sent join request to dev1@127.0.0.1

>> ./dev3/bin/riak-admin join -f dev1@127.0.0.1
Sent join request to dev1@127.0.0.1


☁🚀 ☁ › mix riak_tasks.ping dev
>> ./dev1/bin/riak ping
pong

>> ./dev2/bin/riak ping
pong

>> ./dev3/bin/riak ping
pong
```

## Tasks

### Start all nodes for a configured cluster

```bash
$ mix riak_tasks.start dev
```

### Join all configured nodes as a cluster (only needed once)

```bash
$ mix riak_tasks.join dev
```


### Stop all nodes on a cluster

```bash
$ mix riak_tasks.stop dev
```

### Permanently destroy all data and restart the cluster

```bash
$ mix riak_tasks.destroy dev
```
