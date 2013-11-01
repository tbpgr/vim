vim Cookbook
==============
* vim install
* create .vimrc at /home/your_user
* if you want to change .vimrc, you can change [./files/default/.vimrc]

Requirements
------------
nothing

Platform
------------
* Ubuntu

Attributes
----------
nothing

Usage
-----
#### vim::default
Just include `vim` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[vim]"
  ]
}
```

if you use vagrant, you must write Vagrantfile:

```ruby
config.vm.provision :chef_solo do |chef|
  chef.add_recipe "vim"
end
```

Contributing
------------
nothing

License and Authors
-------------------
Authors: tbpgr
