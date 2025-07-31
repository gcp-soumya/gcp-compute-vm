# Inputs

Name	Description	Type	Default	Required
project_id	The GCP project ID where the VM will be created.	string	n/a	yes
zone	The GCP zone where the VM will be created (e.g., us-central1-a).	string	n/a	yes
instance_name	The name of the VM instance.	string	n/a	yes
machine_type	The machine type for the VM (e.g., e2-medium, n1-standard-1).	string	"e2-medium"	no
boot_disk_image	The boot disk image (e.g., debian-cloud/debian-11, ubuntu-os-cloud/ubuntu-2204-lts).	string	"debian-cloud/debian-11"	no
boot_disk_size_gb	The size of the boot disk in GB.	number	20	no
boot_disk_type	The type of the boot disk (e.g., pd-standard, pd-ssd).	string	"pd-standard"	no
boot_disk_auto_delete	Whether the boot disk should be auto-deleted when the instance is deleted.	bool	true	no
network_name	The name of the VPC network to attach the VM to.	string	"default"	no
subnetwork_name	The name of the subnetwork to attach the VM to. If not specified, a default subnetwork in the zone is used.	string	null	no
assign_external_ip	Whether to assign an ephemeral external IP address to the VM.	bool	true	no
service_account_email	The email of the service account to attach to the VM. Leave empty to use the default compute service account.	string	""	no
service_account_scopes	List of OAuth2 scopes for the service account.	list(string)	["cloud-platform"]	no
network_tags	List of network tags applied to the VM, used for firewall rules.	list(string)	[]	no
labels	A map of key/value labels to assign to the VM instance.	map(string)	{}	no
metadata	A map of key/value metadata to set on the VM instance (e.g., for startup-script, ssh-keys).	map(string)	{}	no
additional_disks	List of additional data disks to attach to the VM. See object structure below.	list(object)	[]	no
scheduling_config	Map of scheduling options for the VM (e.g., on_host_maintenance, automatic_restart, preemptible).	map(any)	{automatic_restart=true, on_host_maintenance="MIGRATE", preemptible=false}	no
can_ip_forward	Whether the VM can forward IP packets (e.g., for NAT or routing).	bool	false	no