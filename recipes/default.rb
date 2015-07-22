package "curl"

bash "download embulk.jar" do
  cwd "/tmp"
  code <<-EOC
  curl -L #{node[:embulk][:download_uri]} -o #{node[:embulk][:jar]}
  chmod +x #{node[:embulk][:jar]}
EOC
  creates node[:embulk][:jar]
end

group node[:embulk][:group] do
  system true
end

user node[:embulk][:user] do
  system true
  group  node[:embulk][:group]
end

template node[:embulk][:bin] do
  owner  node[:embulk][:user]
  group  node[:embulk][:group]
  mode   0755
  source "embulk.erb"
end

directory node[:embulk][:lib_dir] do
  owner node[:embulk][:user]
  group node[:embulk][:group]
  mode  0755
end

directory node[:embulk][:config_dir] do
  owner node[:embulk][:user]
  group node[:embulk][:group]
  mode  0755
end

template "#{node[:embulk][:lib_dir]}/Gemfile" do
  owner    node[:embulk][:user]
  group    node[:embulk][:group]
  mode     0744
  source   "Gemfile.erb"
  notifies :run, "bash[embulk-bundle-install]", :immediately
end

bash "embulk-bundle-install" do
  action :nothing
  user   node[:embulk][:user]
  group  node[:embulk][:group]
  code   "#{node[:embulk][:jar]} bundle #{node[:embulk][:lib_dir]}"
end
