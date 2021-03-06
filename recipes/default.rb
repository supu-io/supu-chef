#
# Cookbook Name:: supu-chef
# Recipe:: default
#
# Copyright (C) 2015 Adria Cidre <adria.cidre@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Install/configure something here
include_recipe 'apt'
include_recipe 'golang'
package 'redis-server'

include_recipe 'supu-chef::ssh'
include_recipe 'supu-chef::gnatsd' # ~FC033
include_recipe 'supu-chef::supu' # ~FC033

log 'replace this with a meaningful resource'
