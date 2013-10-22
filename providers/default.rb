use_inline_resources if respond_to?(:use_inline_resources)

def load_current_resource
  if(defined?(AttributeStruct) && new_resource.config.is_a?(AttributeStruct))
    new_resource.config new_resource.config._dump
  end
  new_resource.config_directory node['haproxy']['conf_dir'] unless new_resource.config_directory
end

action :create do
  new_resource.run_context.node.include_recipe "haproxy::install_#{node['haproxy']['install_method']}"

  cookbook_file '/etc/default/haproxy' do
    source 'haproxy-default'
    owner 'root'
    group 'root'
    mode 00644
    notifies :restart, 'service[haproxy]'
  end

  template ::File.join(new_resource.config_directory, 'haproxy.cfg') do
    source 'haproxy.dynamic.cfg.erb'
    owner 'root'
    group 'root'
    mode 00644
    notifies :reload, 'service[haproxy]'
    variables(:config => new_resource.config)
  end

  service "haproxy" do
    supports :restart => true, :status => true, :reload => true
    action [:enable, :start]
  end

end

action :delete do
end
