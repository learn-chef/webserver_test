package_name = service_name = case node['platform']
when 'centos' then 'httpd'
when 'ubuntu' then 'apache2'
end

package package_name

service service_name do
  action [:enable, :start]
end

file '/var/www/html/index.html' do
  content '<html>
  <body>
    <h1>hello world</h1>
  </body>
</html>'
end
