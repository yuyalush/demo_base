log_level                :info
log_location             STDOUT
node_name                'root'
client_key               '/root/.chef/root.pem'
validation_client_name   'chef-validator'
validation_key           '/etc/chef/validation.pem'
chef_server_url          'http://ubuntu:4000'
syntax_check_cache_path  '/root/.chef/syntax_check_cache'
