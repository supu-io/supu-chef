home_dir = '/home/vagrant'

directory "#{home_dir}/.ssh" do
  mode '0700'
  recursive true
end

bash 'ssh_known_hosts' do
  user 'vagrant'
  cwd '/home/vagrant'
  code <<-EOH
    ssh-keyscan github.com >> /home/vagrant/.ssh/known_hosts
    EOH
end
