#
# Cookbook Name:: build_cookbook
# Recipe:: publish
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
secrets = get_project_secrets

file '/tmp/gpg.key' do
  content "#{secrets['gpg']}"
  sensitive true
end

execute 'gpg --import /tmp/gpg.key' do
  returns [0,2]
end

include_recipe 'coffee-truck::publish'