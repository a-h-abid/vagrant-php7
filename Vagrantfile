require 'json'
require 'yaml'

php7YamlPath = File.expand_path("./vagrant_config/config.yaml")
afterScriptPath = File.expand_path("./vagrant_config/scripts/customize.sh")
aliasesPath = File.expand_path("./vagrant_config/aliases")

require_relative 'vagrant_config/scripts/setup.rb'

Vagrant.configure("2") do |config|
    config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
    if File.exists? aliasesPath then
        config.vm.provision "file", source: aliasesPath, destination: "~/.bash_aliases"
    end

    Php7.configure(config, YAML::load(File.read(php7YamlPath)))

    if File.exists? afterScriptPath then
        config.vm.provision "shell", path: afterScriptPath
    end
end
