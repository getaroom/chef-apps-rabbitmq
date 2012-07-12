#
# Cookbook Name:: apps-rabbitmq
# Recipe:: default
#
# Copyright 2012, getaroom
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

search(:apps) do |app|
  if (app['rabbitmq_role'] & node.run_list.roles).any?
    app['rabbitmq_vhosts'].each do |environment, app_vhost|
      if environment.include? node.chef_environment
        rabbitmq_vhost app_vhost['vhost'] do
          action :add
        end

        rabbitmq_user app_vhost['user'] do
          vhost app_vhost['vhost']
          permissions %{".*" ".*" ".*"}

          if app_vhost['password']
            password app_vhost['password']
            action [:add, :set_permissions]
          else
            action :set_permissions
          end
        end
      end
    end
  end
end
