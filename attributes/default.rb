default[:embulk] = {
  :bin          => "/usr/local/bin/embulk",
  :jar          => "/usr/local/bin/embulk.jar",
  :download_uri => "http://dl.embulk.org/embulk-latest.jar",
  :lib_dir      => "/var/lib/embulk",
  :config_dir   => "/var/lib/embulk/config",
  :user         => "root",
  :group        => "root",
  :plugins      => [
    {:name => "embulk-input-jdbc",},
    {:name => "embulk-output-jdbc",},
    # {:name => "plugin-name", :version => "~> 0.0.1",},
  ],
}
