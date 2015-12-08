class Build
  def Build.configure(config, settings)

    # Configure The Box
    config.vm.box = "ncaro/php7-debian8-apache-nginx-mysql"

    # Configure A Private Network IP
    config.vm.network :private_network, ip: settings["ip"] ||= "192.168.7.7"

    if settings['networking'][0]['public']
      config.vm.network "public_network", type: "dhcp"
    end

    # Configure A Few VirtualBox Settings
    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", settings["memory"] ||= "2048"]
      vb.customize ["modifyvm", :id, "--cpus", settings["cpus"] ||= "1"]
      vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      vb.customize ["modifyvm", :id, "--ostype", "Debian_64"]
      vb.customize ["modifyvm", :id, "--audio", "none", "--usb", "off", "--usbehci", "off"]
    end

    # Configure Port Forwarding To The Box
    config.vm.network "forwarded_port", guest: 80, host: 8000
    config.vm.network "forwarded_port", guest: 443, host: 44300
    config.vm.network "forwarded_port", guest: 3306, host: 33060

    # Add Custom Ports From Configuration
    if settings.has_key?("ports")
      settings["ports"].each do |port|
        config.vm.network "forwarded_port", guest: port["guest"], host: port["host"], protocol: port["protocol"] ||= "tcp"
      end
    end

    # Register All Of The Configured Shared Folders
    if settings['folders'].kind_of?(Array)
      settings["folders"].each do |folder|
        config.vm.synced_folder folder["map"], folder["to"], type: folder["type"] ||= nil
      end
    end

    # Turn on PHP-FPM for nginx, or enable the right module for Apache
    if settings["php"] == 7
      if settings["nginx"] ||= false
          config.vm.provision "shell", inline: "sudo service php5-fpm stop && sudo service php7-fpm restart"
      else
          config.vm.provision "shell", inline: "sudo a2dismod php5 && sudo a2enmod php7"
      end
    else
      if settings["nginx"] ||= false
          config.vm.provision "shell", inline: "sudo service php7-fpm stop && sudo service php5-fpm restart"
      else
          config.vm.provision "shell", inline: "sudo a2dismod php7 && sudo a2enmod php5"
      end
    end

    # Turn on the proper server
    config.vm.provision "shell" do |s|
        if settings["nginx"] ||= false
          s.inline = "sudo apachectl stop && sudo service nginx restart"
        else
          s.inline = "sudo service nginx stop && sudo apachectl restart"
        end
    end

  end
end
