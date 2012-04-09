begin
  require 'filesystem'

  Facter.add("mounts") do
    ignorefs = ["NFS", "nfs", "nfs4", "nfsd", "afs", "binfmt_misc", "proc", "smbfs",
			    "autofs", "iso9660", "ncpfs", "coda", "devpts", "ftpfs", "devfs",
			    "mfs", "shfs", "sysfs", "cifs", "lustre_lite", "tmpfs", "usbfs", "udf",
			    "fusectl", "fuse.snapshotfs", "rpc_pipefs"]
    mountpoints = []
    FileSystem.mounts.each do |m|
      if ((not ignorefs.include?(m.fstype)) && (m.options !~ /bind/))
        mountpoints << m.mount
      end
    end
    setcode do
      mountpoints.join(',')
    end
  end

rescue Exception => e
end
