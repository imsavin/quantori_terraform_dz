sudo useradd -m -d /home/teacher -s /bin/bash teacher
sudo mkdir /home/teacher/.ssh
sudo echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCkBIEsfJD6d0J4tqTnVq4z3Ve0bop71b+27j75gncRsLdAokiUqGyt1fmvS+VkoBWxOFiAOsfdSdTwJWyGs0kplZouOh93cRc/9mp16mNcR5B86+ORLrMZCq3ZGVj2F3YjtoeK4b+RvEtpRmJaC/no9yjTeDTnBYVsV+vQvxiaaeLzkbPRhd0Ovlayoz/gXqI4DOCaQTfISHxG7X+NLfpWR6LsfaHYKG/5WmaA3LOnYAqV+S7nq2WQVQ2Z5bzpJC9s= andrey@MBP-Andrey' >> /home/teacher/.ssh/autorized_keys
sudo chown -R teacher:teacher /home/teacher/.ssh
sudo chmod 700 /home/teacher/.ssh
sudo chmod 600 /home/teacher/.ssh/authorized_keys

sudo useradd -m -d /home/home -s /bin/bash home
sudo mkdir /home/home/.ssh
sudo echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCkBIEsfJD6d0J4tqTnVq4z3Ve0bop71b+27j75gncRsLdAokiUqGyt1fmvS+VkoBWxOFiAOsfdSdTwJWyGs0kplZouOh93cRc/9mp16mNcR5B86+ORLrMZCq3ZGVj2F3YjtoeK4b+RvEtpRmJaC/no9yjTeDTnBYVsV+vQvxiaaeLzkbPRhd0Ovlayoz/gXqI4DOCaQTfISHxG7X+NLfpWR6LsfaHYKG/5WmaA3LOnYAqV+S7nq2WQVQ2Z5bzpJC9s= andrey@MBP-Andrey' >> /home/home/.ssh/autorized_keys
sudo chown -R home:home /home/home/.ssh
sudo chmod 700 /home/home/.ssh
sudo chmod 600 /home/home/.ssh/authorized_keys

sudo useradd -m -d /home/work -s /bin/bash work
sudo mkdir /home/work/.ssh
sudo echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLwclAWDYRPg0ZUqZjdckEW+4E5E4OGZSCPfPdr3/MGfSe+I+Q4ibrR7reQfGaVUSIrrFL2Cw83hbPWnv1WjGeQkQccY8x80BefAgKEmhbAFg4d9Y/O/wHsvDM4giupLJEJjBBPFjPZU3oXrd4GheVE4wfkRaJC3NaJVygc++WljfEC0/whyDAfwv5PZqKCs8ERCqlMJBUzB5roZnOXLP5vPsucaBJpHx5/0HGVFhnK9tsVwL1JWiClDW3oR8YdN+r0Sw/pJ1xW3aRxnT2+N/rqO3rZXYI5vNm1YJ0DtVeeCn3c5CUFqkJJ6vS+8SkyhumgQTKcF8pxvGcJSEt9j4j avial@darkstar' >> /home/work/.ssh/autorized_keys
sudo chown -R work:work /home/work/.ssh
sudo chmod 700 /home/work/.ssh
sudo chmod 600 /home/work/.ssh/authorized_keys
sudo chmod 600 /home/work/.ssh/authorized_keys

sudo amazon-linux-extras install nginx1
sudo cp /etc/nginx /etc/nginx.old
# sudo mkdir /etc/nginx
sudo echo -e "http {\n server {\n listen 8888\n location / {\n  root /usr/share/nginx/html/\n  }\n }\n}" > /etc/nginx/nginx.conf

IP=$(curl http://169.254.169.254/local-ipv4)
REGION=$(curl http://169.254.169.254/placement/region)
AZ=$(curl http://169.254.169.254/placement/availability-zone)

sudo echo -e "<center><h2>IP: $IP</h2><br><h2>REGION: $REGION</h2><br><h2>AZ: $AZ</h2></center>" > /usr/share/nginx/html/index.html
sudo systemctl nginx start
