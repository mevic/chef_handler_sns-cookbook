# encoding: UTF-8
#
# Cookbook Name:: chef_handler_sns
# Author:: Xabier de Zuazo (<xabier@onddo.com>)
# Attributes:: default
# Copyright:: Copyright (c) 2014 Onddo Labs, SL. (www.onddo.com)
# License:: Apache License, Version 2.0
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

default['chef_handler_sns']['topic_arn'] = nil
default['chef_handler_sns']['access_key'] = nil
default['chef_handler_sns']['secret_key'] = nil
default['chef_handler_sns']['token'] = nil
default['chef_handler_sns']['region'] = nil
default['chef_handler_sns']['subject'] = nil
default['chef_handler_sns']['body_template'] = nil

default['chef_handler_sns']['supports'] = {
  'exception' => true,
  'report' => false
}
default['chef_handler_sns']['version'] = nil
