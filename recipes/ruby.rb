#
# Cookbook Name:: workstation
# Recipe:: ruby
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

target_user = node['workstation']['machine']['target_user']
node.default['rvm']['group_users'] = [node['workstation']['machine']['target_user']]

execute 'gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3'
execute 'curl -sSL https://get.rvm.io | bash -s stable'

include_recipe 'rvm::system'

versions = node['workstation']['ruby']['versions']
if versions.any?
  versions.each do |version|
    rvm_ruby version
    node['workstation']['ruby']['gems'].each do |gem|
      rvm_gem gem do
        ruby_string version
        ignore_failure true
      end
    end
  end
  rvm_default_ruby versions.last
end
