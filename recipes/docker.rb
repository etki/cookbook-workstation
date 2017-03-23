#
# Cookbook Name:: workstation
# Recipe:: docker
#
# Copyright 2016, Etki
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

docker_installation 'default' do
  action [:create]
end
# todo: this has been added because chef has tried to connect to upstart
# on linux mint
# this should be fixed when possible
docker_service_manager_systemd 'default' do
  host ['unix:///var/run/docker.sock', 'tcp://127.0.0.1:2376']
  action [:start]
end

node['workstation']['docker']['images'].each do |image|
  segments = image.split(':')
  repo = segments[0]
  tag = segments.size > 1 ? segments[1] : 'latest'
  docker_image "#{repo}:#{tag}" do
    repo repo
    tag tag
  end
end

group 'docker' do
  append true
  members [node['workstation']['machine']['target_user']]
end
