# Tailscale Subnet Router with Terraform

This project demonstrates how to deploy a Tailscale subnet router on a Raspberry Pi using Terraform. The router advertises a local subnet (`10.0.0.0/24`) to the Tailnet and allows SSH access to devices within the subnet.

## Project Overview
- **Subnet**: 10.0.0.0/24
- **Devices**: Raspberry Pi (Linux) acting as a subnet router, and a Windows device connected to the same Tailnet.
-  **Tooling**: 
  - **Tailscale**: To create a secure VPN and advertise the local subnet.
  - **Terraform**: To automate the configuration and setup of Tailscale and the subnet router.
  - **Raspberry Pi** (running Linux): The device acting as the subnet router.
  - **Git**: To manage version control and push the project to GitHub.
- **Functionality**: Advertises a physical network range as a subnet to allow devices connected to Tailscale to access the devices on the subnet.

## Prerequisites
- **Tailscale account**: Sign up at [tailscale.com](https://tailscale.com).
- **Tailscale API key**: You can generate this from the Tailscale Admin Console.
- **A Raspberry Pi** (or any machine running Linux) to act as the subnet router.
- **Terraform installed**: Download from [terraform.io].
- **Git installed**: Required for version control. 
- **A GitHub repository and account**: You will need a GitHub account to store your project and push your code.

## My Tailnet Information
- **Tailnet DNS**: tail9c0397.ts.net

## Setup Instructions

### 1. Clone the Repository
Clone this repository to your local machine:

```bash
git clone https://github.com/your-username/tailscale-subnet-router.git
cd tailscale-subnet-router
```

### 2. Configure the Tailscale API key
Create a 'tailscale.tfvars' file and add your Tailscale API key:

```bash
echo 'tailscale_api_key = "your-api-key-here"' > terraform.tfvars
```

### 3. Initialize and Apply Terraform
Run the following commands to initialize and apply the Terraform configuration:

```bash
terraform init
terraform apply
```

### 4. Join the Raspberry Pi to the Tailnet
Install Tailscale on your Raspberry pi if it's not installed already:

```bash
curl -fsSL https://tailscale.com/install.sh | sh
```

Use the Generated authentication key to join the Raspberry Pi to your tailnet:

```bash
sudo tailscale up --authkey tskey-xxxxxx --advertise-routes=10.0.0.0/24
```

Verify that the Raspberry Pi is connected to Tailscale:

```bash
tailscale status
```

### 5. Verfiy Subnet Advertisement is working
- In the Tailscale Admin Console: Check that the Raspberry Pi is advertising the 10.0.0.0/24 subnet under the listed machine.

-From another device in the Tailnet, try to ping a device on the subnet:

```bash
ping 10.0.0.x
```

## Usage 

- Once the subnet is advertised, devices connected to your Tailnet can access devices on the 10.0.0.0/24 subnet.

- SSH Access: You can SSH into the Raspberry Pi from any other device in the Tailnet using the Raspberry Pi’s Tailscale IP:

```bash
ssh pi@<Tailscale IP>
```


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


