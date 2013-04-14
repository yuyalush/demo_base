curl -L http://www.opscode.com/chef/install.sh | sudo bash
mkdir ~/.chef
curl -L https://gist.github.com/yuyalush/5382134/raw/87c33ded20eb4111071e057022ba63c255776b18/knife.rb >> ~/.chef/knife.rb
knife cookbook create demo_base -o cookbooks
cd cookbooks/demo_base
curl -L https://gist.github.com/yuyalush/5382134/raw/773712c8703602c93004f6f58a24b1d84dfca3fb/Gemfile >> files/default/Gemfile
curl -L https://gist.github.com/yuyalush/5382134/raw/95c25a454a94a5c0d451c849936251e29248cbb8/default.rb >> recipes/default.rb
curl -L https://gist.github.com/yuyalush/5382134/raw/64d2431cf7fa015cdb4c099f2e45e6491b7d4f12/localhost.js >> localhost.json
curl -L https://gist.github.com/yuyalush/5382134/raw/82e191ea599fed998d54116ab61a6c92b56eec88/solo.rb >> solo.rb
chef-solo -c solo.rb -j ./localhost.json
