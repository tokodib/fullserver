# Fullserver

This project is a learning project for building and managing a homelab infrastructure with **Terraform and Ansible** on **Proxmox**.

The goal is to build a small but realistic server environment where I can practice infrastructure automation, Linux administration, Docker, monitoring, and container orchestration.

The infrastructure is built step by step, with Terraform responsible for creating the virtual machines and Ansible planned for configuring them.

## Infrastructure

The current plan consists of three virtual machines and one existing LXC container.

### 1. Samba & CUPS LXC

An existing LXC container running on Proxmox.

- Samba file server
- CUPS print server

This container is kept outside the Terraform-managed virtual machines.

### 2. Media VM

**IP:** `192.168.1.120`

The media server will be used for storing and serving:

- Videos
- Photos
- Programs
- E-books

Planned services:

- Plex
- qBittorrent
- Calibre-Web

### 3. Developer VM

**IP:** `192.168.1.130`

The development server will be used for:

- Software development
- MariaDB
- PostgreSQL
- Gitea
- Local application testing
- CI/CD experiments
- Docker

I also plan to use this VM to learn **Docker Swarm** and understand how container orchestration works in a multi-container environment.

### 4. Monitoring VM

**IP:** `192.168.1.150`

The monitoring server will be responsible for monitoring the homelab infrastructure.

Planned services:

- Heimdall
- Prometheus
- Grafana
- Alertmanager
- Loki
- Slack notifications

The goal is to monitor the other servers and receive alerts when something goes wrong.

## Infrastructure Overview

```text
                         Proxmox
                            │
              ┌─────────────┼─────────────┐
              │             │             │
              ▼             ▼             ▼
         Developer        Media       Monitoring
         .130             .120           .150
              │             │             │
              ▼             ▼             ▼
        Docker Swarm      Plex/etc.    Prometheus
                                      Grafana
                                      Loki
                                      Alertmanager

              Existing LXC
                   │
                   ├── Samba
                   └── CUPS
```

## Automation

The infrastructure is intended to be managed in two main stages:

```text
Terraform
    │
    ▼
Proxmox virtual machines
    │
    ▼
Ansible
    │
    ▼
Operating system configuration
    │
    ▼
Applications and services
```

Terraform is used to define and create the virtual machines.

Ansible will be used to configure the operating systems and install the required software and services.

## Learning Goals

Through this project I want to gain practical experience with:

- Terraform
- Ansible
- Linux administration
- Proxmox
- Docker
- Docker Swarm
- Git and Gitea
- Databases
- CI/CD
- Monitoring
- Prometheus and Grafana
- Container orchestration

Kubernetes / K3s is planned as a later learning step.

## Project Status

The project is being built step by step.

### Completed

- Proxmox infrastructure prepared
- Terraform project initialized
- Proxmox provider configured
- VM definitions created with Terraform
- Three virtual machines created
- Static IP addresses configured
- SSH access verified

### Next Steps

- Configure the VMs with Ansible
- Prepare the Developer VM
- Install Docker
- Create a Docker Swarm lab
- Configure the Media VM
- Build the Monitoring VM
- Add monitoring to the infrastructure
- Experiment with Kubernetes / K3s

This project is primarily a learning environment, so the configuration and architecture may change as I learn more.