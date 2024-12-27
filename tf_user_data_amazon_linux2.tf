#commands are for Amazon Linux 2
    user_data = <<-EOF
        #!/bin/bash
        sudo yum update -y
        sudo yum install -y docker
        sudo systemctl start docker
        echo "Docker has started"
        docker --version
        sudo systemctl enable docker
        sudo usermod -aG docker $ec2-user
        sudo docker pull jenkins/jenkins:lts
        echo "Pulled Jenkins into container"
        sudo docker run -d -p 8080:8080 jenkins/jenkins:lts
        echo "Jenkins is now installed and can be accesed"
    EOF
