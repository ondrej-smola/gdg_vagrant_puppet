VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  config.vm.box = "debian_cyber"   
  config.vm.provision "shell", path: "scripts/puppet.sh"  
  
    
  config.vm.define "slave" do |db|
  
	db.vm.network :forwarded_port, guest: 22, host: 4200	
	db.vm.network :private_network, ip: "192.168.56.102"	
	db.vm.hostname = "slave.example.com"
	
	db.vm.provider :virtualbox do |vb|  	
		vb.name = "slave"
		vb.customize ["modifyvm", :id, "--memory", "1024"]				
	end	
  end
  
  config.vm.define "slave2" do |db|   
  
	db.vm.network :forwarded_port, guest: 22, host: 4207	
	db.vm.network :private_network, ip: "192.168.56.103"
	db.vm.hostname = "slave2.example.com"
	
	db.vm.provider :virtualbox do |vb|  	
		vb.name = "slave2"					
	end		
  end
  
  config.vm.define "backup" do |db|   
  
	db.vm.network :forwarded_port, guest: 22, host: 4208
	db.vm.network :private_network, ip: "192.168.56.104"
	db.vm.hostname = "slave2.example.com"
	
	db.vm.provider :virtualbox do |vb|  	
		vb.name = "backup"					
	end		
  end
  
end

