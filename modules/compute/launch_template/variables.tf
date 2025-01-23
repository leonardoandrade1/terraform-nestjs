variable "security_group" {}


variable "nestjs_ec2_user_data" {
  type = string

  default = <<-EOF
  #!/bin/bash
  # Update the instance and install necessary tools
  sudo apt-get update -y
  sudo apt-get upgrade -y
  sudo apt-get install -y git curl build-essential

  # Install Node.js (replace version with the desired one)
  curl -sL https://deb.nodesource.com/setup_20.x | bash -
  sudo apt-get install -y nodejs

  # Verify Node.js and npm installation
  node -v
  npm -v

  # Clone the NestJS project repository
  cd /home/ubuntu
  git clone https://github.com/leonardoandrade1/simple-nestjs.git
  sudo chown -R $USER:$USER /home/ubuntu/simple-nestjs
  cd simple-nestjs

  # Install the project dependencies
  npm install
  npm run build


  # Start the NestJS application (you can modify this for your environment, e.g., background process)
  npm run start:prod
  EOF
}