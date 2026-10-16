### 2026-10-04
Terraform VM creation

- Created Developer VM
- Created Media VM
- Created Monitoring VM
- Configured static IP addresses
- Verified SSH access
- Added Terraform outputs
- Terraform state now tracks all three VMs


### 2026-10-10 - Ansible initialization, connectivity, and configuration

Goal: Prepare and configure the three Terraform-managed VMs using Ansible

What I did:
    - Vreated the ansible / directory
    - Added `inventory.ini` with separate group for developer, media, and monitoring.
    - Configured automation as the default SSH user
    - Tested connectivity to all three VMs using the Ansible ping module
    - Created and executed the first Ansible playbook, `site.yml`
    - Gathered system information and installed basic packages (curl, vim, htop, btop, git and mc) on all three VMs
    - Added a group-specific task to install `neofetch` on the monitoring VM.

What I learned:
    - An ansible inventory defines the hosts and groups that managed by Ansible.
    - Playbooks describe repeatable configuration tasks
    - Ansibl;e modules perform specific operations on remote hosts
    - The hosts directive and inventory groups control where tasks run
    - Group-specific tasks allow different VMs to receive different packages and configurations

Result: All three VMs are reachable through Ansible and have received their initial configuration. The monitoring VM has an additional package installed specifically for its group.

Next step: Review the playbook structure, verify the configuration is repeatable, and prepare the first Git-managed Ansible configuration milestone.

Git commit: Configure base packages with Ansible

### 2026-10-11 - Docker and Webmin setup and verification
    - Installed and configured Docker Engine and Webmin on all three Ubuntu VMs
    - Installed Docker Compose plugin on all three VMs
    - Confirmed that the Docker service is active on each VM.
    - Kept Webmin available on all three servers for web-based administration
    - Added automated system package upgrades to the common Ansible configuration
    - Ran the Ansible playbook successfully across all three VMs

### 2026-10-16 – Docker Services and Centralized Management

Overview

Deployed and verified the main Docker services across the three Ubuntu virtual machines managed by the Proxmox homelab. The monitoring VM now provides centralized container management through Portainer and centralized log viewing through Dozzle.

Developer VM (192.168.1.130)

Installed and configured the following containers:

Gitea – self-hosted Git service for source code and configuration repositories.

MariaDB – relational database server.

PostgreSQL – relational database server.

pgAdmin – web-based PostgreSQL administration.

phpMyAdmin – web-based MariaDB/MySQL administration.

Portainer Agent – allows the central Portainer instance to manage Docker on this VM.

Dozzle Agent – provides container logs to the central Dozzle instance.

Media VM (192.168.1.120)

Installed and configured:

Plex – media server for streaming the local media library to the Hisense TV over the home network.

Portainer Agent – enables centralized Docker management.

Dozzle Agent – forwards container logs to the monitoring VM.

Plex playback was tested successfully on the local network. Remote access is not required.

Monitoring VM (192.168.1.150)

Installed and configured:

Portainer Server – central management interface for Docker environments on all three VMs.

Dozzle – centralized log viewer for local containers and remote agents.

Uptime Kuma – service availability monitoring.

Heimdall – dashboard for accessing homelab services.

Centralized Management and Verification

Added the Developer and Media Docker environments to Portainer using Portainer Agents.

Verified that containers from all three VMs appear in the central Portainer interface.

Configured Dozzle to connect to the remote agents on the Developer and Media VMs.

Confirmed that the main services are running and visible in the management interfaces.

Architecture Notes

The three VMs have separate responsibilities: development, media, and monitoring.

Portainer provides centralized Docker administration.

Dozzle provides centralized container log access.

Plex is intended for local-network use only.

Service configurations should be maintained in version control and automated through Ansible where practical.

Next Steps

Review and document Docker Compose configurations for each service.

Ensure service deployments are reproducible through Ansible.

Configure and verify Uptime Kuma checks for important services.

Review backup and recovery procedures for application data and databases.

Keep credentials and other secrets out of Git.