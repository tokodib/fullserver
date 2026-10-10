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

