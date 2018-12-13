require 'net/sftp'

class SftpDeployer

	def initialize(baseDir,siteFolder,host,user,password)
		@sftp = Net::SFTP.start(host,user,:password => password)
		@baseDir = baseDir
		@siteFolder = siteFolder
	end

	def upload(dir)
		@sftp.session.exec!("rm -rf #{backup_site_path}")	
		@sftp.rename!(site_path, backup_site_path) if (dir_entry_names().include?(@siteFolder) )
		@sftp.mkdir!(@baseDir + "/" + @siteFolder, :permissions => 0755)
		@sftp.upload!(dir,site_path)
	end

	def site_path
		@baseDir + "/" + @siteFolder
	end

	def backup_site_path
		site_path + ".bak"
	end

	def dir_entry_names
		@sftp.dir.glob(@baseDir,"*",0).map {|n| n.name}
	end

end

deployer = SftpDeployer.new("www/htdocs/w00d8526/agiledojo","site",ENV['SFTP_HOST'],ENV['SFTP_USER'],ENV['SFTP_PASSWORD'])
deployer.upload("_site")
