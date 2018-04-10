#
# Cookbook:: dotnetcore
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#adding yum repo and importing gpgkey
#this enables microsoft product feed
file node['dotnetcore']['repo']['path'] do
	content "[#{node['dotnetcore']['package']['name']}]
name=#{node['dotnetcore']['package']['name']}
baseurl= #{node['dotnetcore']['repo']['baseurl']}
enabled=1
gpgcheck=1
gpgkey=#{node['dotnetcore']['repo']['gpgkeyurl']}"
end

#installing dotnetcore package and dependencies
package %w(libunwind libicu)
yum_package node['dotnetcore']['package']['name']
yum_package 'epel-release'

#installing nginx
yum_package 'nginx'