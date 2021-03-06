# encoding: UTF-8
#
# Author:: Xabier de Zuazo (<xabier@onddo.com>)
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

require_relative '../spec_helper'

describe 'chef_handler_sns resource' do
  let(:topic_arn) { 'arn:aws:sns:us-east-1:12341234:MyTopicName' }
  let(:chef_handler_sns_path) { '/tmp/chef-handler-sns' }
  let(:chef_run) do
    ChefSpec::SoloRunner.new(
        platform: 'ubuntu', version: '12.04',
        step_into: ['chef_handler_sns']
      ) do |node|
      node.set['chef_handler_sns']['topic_arn'] = topic_arn
    end.converge('chef_handler_sns::default')
  end

  before do
    gemspec = Gem::Specification.new
    gemspec.name = 'chef-handler-sns'
    allow(gemspec).to receive(:lib_dirs_glob).and_return(chef_handler_sns_path)
    allow(Gem::Specification)
      .to receive(:find_by_name).with('chef-handler-sns').and_return(gemspec)
  end

  it 'includes xml::ruby recipe' do
    expect(chef_run).to include_recipe('xml::ruby')
  end

  it 'installs chef-handler-sns gem' do
    expect(chef_run).to install_chef_gem('chef-handler-sns')
  end

  it 'runs chef_handler resource' do
    expect(chef_run).to enable_chef_handler('Chef::Handler::Sns').with(
      source: "#{chef_handler_sns_path}/chef/handler/sns",
      supports: Mash.new(
        exception: true,
        report: false
      )
    )
  end
end
