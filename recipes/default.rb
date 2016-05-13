#
# Cookbook Name:: webserver_test
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
package_name = service_name = case node['platform']
when 'centos' then 'httpd'
when 'ubuntu' then 'apache2'
end

# Install the package.
package package_name

# Start and enable the service.
service service_name do
  action [:enable, :start]
end

# Serve a custom home page.
file '/var/www/html/index.html' do
  content '<html>
  <body>
    <h1>hello world</h1>
  </body>
</html>'
end
