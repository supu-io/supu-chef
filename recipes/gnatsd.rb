user 'nats'

directory '/opt/gnatsd/' do
  owner 'nats'
  group 'nats'
  mode '0755'
end

remote_file '/opt/gnatsd/gnatsd.tar.gz' do
  source 'https://github.com/apcera/gnatsd/releases/download/v0.5.6/gnatsd-v0.5.6-linux-amd64.tar.gz'
  mode 0755
  action :create
end

execute 'extract gnatsd' do
  command <<-EOH
    tar -zxvf gnatsd.tar.gz ./gnatsd
    chown nats:nats gnatsd
    chmod 755 gnatsd
  EOH
  cwd '/opt/gnatsd'
end

template '/etc/init/gnatsd.conf' do
  source 'gnatsd.conf.erb'
  owner 'root'
  group 'root'
  mode  '0755'
end

service 'gnatsd' do
  supports [:start, :stop, :restart]
  action [:enable, :start]
end
