use Mix.Config

config :riak_tasks,
  riak_version: "2.0.2",
  riak_download_url: "http://s3.amazonaws.com/downloads.basho.com/riak/2.0/2.0.2/osx/10.8/riak-2.0.2-OSX-x86_64.tar.gz",
  num_nodes: 3,
  ring_size: 16


config :riak_tasks, :dev, [
  [host: "127.0.0.1",
   http_port: 12101,
   protobuf_port: 12102,
   handoff_port: 12103,
   solr_port: 12104,
   jmx_port: 12105],

  [host: "127.0.0.1",
   http_port: 12121,
   protobuf_port: 12122,
   handoff_port: 12123,
   solr_port: 12124,
   jmx_port: 12125],

  [host: "127.0.0.1",
   http_port: 12131,
   protobuf_port: 12132,
   handoff_port: 12133,
   solr_port: 12134,
   jmx_port: 12135],
]


config :riak_tasks, :test, [
  [host: "127.0.0.1",
   http_port: 11101,
   protobuf_port: 11102,
   handoff_port: 11103,
   solr_port: 11104,
   jmx_port: 11105],

  [host: "127.0.0.1",
   http_port: 11121,
   protobuf_port: 11122,
   handoff_port: 11123,
   solr_port: 11124,
   jmx_port: 11125],

  [host: "127.0.0.1",
   http_port: 11131,
   protobuf_port: 11132,
   handoff_port: 11133,
   solr_port: 11134,
   jmx_port: 11135],
]
# import_config "#{Mix.env}.exs"
