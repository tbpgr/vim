#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright 2013
#
log "start update apt-get"
execute "update package index" do
  command "apt-get update"
end.run_action(:run)
log "end   update apt-get"

log "start install vim"
package 'vim' do
  action :install
end
log "end   install vim"

log "start copy .vimrc"
data_ids = data_bag('users')
data_ids.each do |id|
  user = data_bag_item('users', id)
  cookbook_file "/home/#{user['name']}/.vimrc" do
    source ".vimrc"
    owner user['name']
    group user['group']
    mode "0755"
  end
end
log "end   copy .vimrc"
