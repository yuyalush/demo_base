curl -L http://www.opscode.com/chef/install.sh | sudo bash
mkdir ~/.chef
curl -L https://gist.github.com/yuyalush/5382134/raw/87c33ded20eb4111071e057022ba63c255776b18/knife.rb >> ~/.chef/knife.rb
knife cookbook create demo_base -o cookbooks
cd cookbooks/demo_base
curl -L https://raw.github.com/yuyalush/demo_base/master/files/default/Gemfile >> files/default/Gemfile
curl -L https://raw.github.com/yuyalush/demo_base/master/recipes/default.rb >> recipes/default.rb
curl -L https://raw.github.com/yuyalush/demo_base/master/localhost.json >> localhost.json
curl -L https://raw.github.com/yuyalush/demo_base/master/solo.rb >> solo.rb
chef-solo -c solo.rb -j ./localhost.json
