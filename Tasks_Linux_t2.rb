agrant.configure("2") do |config|
  
  
  servers=[
	{
	:hostname => "m1",
	:box => "ubuntu/xenial64",
	:ip => "172.16.1.54",
	:ssh_port => '2220'
	},
	{
	:hostname => "m2",
	:box => "ubuntu/xenial64",
	:ip => "172.16.1.55",
	:ssh_port => '2221'
	},
	{
	:hostname => "m3",
	:box => "ubuntu/xenial64",
	:ip => "172.16.1.56",
	:ssh_port => '2223'
	}
  ]
  
  
  servers.each do |machine|
		config.vm.define machine[:hostname] do |node|
			node.vm.box = machine[:box]
			node.vm.hostname = machine[:hostname]
			node.vm.network :private_network, ip: machine[:ip]
			node.vm.network "forwarded_port", guest: 22, host: machine[:ssh_port], id: "ssh"
			node.vm.synced_folder "d:/Projects/OSMU/VirtualBox", "/var/www"

			
			#SSH
			#ssh-keygen -b 4096
			#ssh-copy-id kali@172.16.1.55
			#ssh kali@172.16.1.55
			#sudo nano /etc/ssh/sshd_config
			#sudo systemctl restart ssh
			
			#chmod 777 file1.txt //права доступа
			#scp root@172.16.1.54:dirlist.txt 
			#tar -cf filename.tar file1 file2 fileN
			
			#mkdir current new old 
			#tar cf myarch.tar current new old 

			
			node.vm.provision "shell", 
				
			inline: '
		
			
			',
			run: "always",
			privileged: "false"

				
			node.vm.provider :virtualbox do |vb|
				vb.gui = false
				vb.memory = 1024
				vb.cpus = 2
				
			end
				
		end
	
	end
	
end
