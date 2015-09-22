directory '/opt/supu-io/' do
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end

['api', 'core'].each do |repo|
  dir = "/opt/supu-io/#{repo}"
  git dir do
    user 'vagrant'
    group 'vagrant'
    repository "https://github.com/supu-io/#{repo}.git"
    revision 'master'
    action :sync
  end

  execute "build-project" do
    command "su vagrant -l -c 'cd #{dir} && make deps && make build'"
    action :run
  end

  template "/etc/init/#{repo}.conf" do
    source "supu-service.conf.erb"
    owner 'root'
    group 'root'
    mode '0755'
    action :create
    variables(name: repo)
  end

  service repo do
    supports [:start, :stop, :restart]
    action [:enable, :start]
  end
end
