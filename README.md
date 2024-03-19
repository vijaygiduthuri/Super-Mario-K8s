# Super-Mario-K8s
![SuperMario-EKS-Thumbnail](https://github.com/vijaygiduthuri/Super-Mario-K8s/assets/125960600/1b758d2f-96e3-4351-8bab-3703e2e60941)


# Step 1: **Launch EC2 (Ubuntu):**

- Provision an EC2 instance on AWS with Ubuntu AMI and Instance type t2.medium & with 15GB storage.
- create IAM Role with Administrator permissions and Attach to EC2-Instance
- Connect to the instance using SSH.

# **Step 2: Clone the Code:**

- First Update all the packages using
  
```
sudo apt update
sudo su
```

- Clone your application's code repository onto the EC2 instance:
    
    ```bash
    git clone https://github.com/vijaygiduthuri/Super-Mario-K8s.git
    ```
    
# **Step 3: Install Jenkins on EC2-Instance using shell script:**
- vi script1.sh
  
```
#!/bin/bash
sudo su
sudo apt update -y
wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc
echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list
sudo apt update -y
sudo apt install temurin-17-jdk -y
/usr/bin/java --version
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
                  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
                  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
                              /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
sudo systemctl start jenkins
```
- sudo chmod 777 script1.sh
- sh script.sh

  
