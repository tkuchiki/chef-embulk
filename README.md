Embulk Cookbook
==================

Requirements
------------

Java runtime environment.

### Platform

- Ubuntu
- CentOS 6
- Amazon Linux

Attributes
----------

- `node[:embulk][:bin]` - embulk wrapper script path.
- `node[:embulk][:jar]` - embulk jar file path.
- `node[:embulk][:download_uri]` - embulk jar file URL.
- `node[:embulk][:lib_dir]` - embulk GEM_HOME.
- `node[:embulk][:config_dir]` - config file directory.
- `node[:embulk][:user]` - user.
- `node[:embulk][:group]` - group.
- `node[:embulk][:plugins]` - Gemfile.

Gemfile
-------

```
default[:embulk][:plugins] =  [
  {:name => "embulk-input-jdbc",},
  {:name => "embulk-output-jdbc",},
  {:name => "embulk-input-s3", :version => "~> 0.2.0",},
],
```

```
$ cat Gemfile
source 'https://rubygems.org'

gem 'embulk-input-jdbc'
gem 'embulk-output-jdbc'
gem 'embulk-input-s3', "~> 0.2.0"
```
