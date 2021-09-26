#! /bin/bash
sudo useradd -m -d /home/teacher -s /bin/bash -G wheel,adm teacher
sudo mkdir /home/teacher/.ssh
sudo echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCkBIEsfJD6d0J4tqTnVq4z3Ve0bop71b+27j75gncRsLdAHLVg/InhJdrtnVszNGzPIPTXM8jsb/cc0e0JDD7Teoqz0YxJH+ZhY5Y6iy5n8Vx+CCWr5Rra5IpfJclvDPbH+okiUqGyt1fmvS+VkoBWxOFiAOsfdSdTwJWyGs0kplZouOh93cRc/9mp16mNcR5B86+ORLrMZCq3ZGVj2F3YjlhXb1/aUz7Mi1E6Ze9UQQe2oKqf4w8wXIiSejCcrsZ9CT6SX28Kqw2Ilb+7cr84vXIQDKxZySupztn8qMFlDvtoeK4b+RvEtpRmJaC/no9yjTeDTnBYVsV+vQvxiaaeLzkbPRhd0Ovlayoz/gXqI4DOCaQTfISHxG7X+NLfpW6Hmvgf+2i9OStUMJatDx6y1BAj5cjBKo1JRS73U2o5wYYTAlq6jaDAUzWE8Ili7cZ2Qx2dz5uFq6S8NteIt9yR6LsfaHYKG/5WmaA3LOnYAqV+S7nq2WQVQ2Z5bzpJC9s= andrey@MBP-Andrey' >> /home/teacher/.ssh/authorized_keys
sudo chmod 600 /home/teacher/.ssh/authorized_keys
sudo chmod 700 /home/teacher/.ssh
sudo chown -R teacher:teacher /home/teacher
sudo echo "teacher ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users

sudo useradd -m -d /home/home -s /bin/bash -G wheel,adm home
sudo mkdir /home/home/.ssh
sudo echo -e 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDinnjV6O4zICVu2XzTFJpEsWp39gLkNI3kFkEbg7BissIhXPY+uH4CMGtUznltqPwpoBcomol4xHpdyRf+9yEsMbMy8V04BM0/LKdG+87F/aaHRRsOD8Lj0jlSzGMup694slxSJOnqzBHqSUV8r++zOa9p6zxR/0aWN3y+NbdtUPGCPGSRBgois2Kt9J5UzYVY0EjYrIPtSx+h/hwcE1TAVeMu2Mi3+8ntV0pVT2R1NVQdV0MruX8y16HsGx0+6pDFSaVAcLcPE9+2CbD5EKsxPk/w0u8iB71k1G2dFOBj2MhlL6GnfP3SSAaAjsHC+lWsnmltZkIG8Xt9UttUvb2d avial@darkstar\n' >> /home/home/.ssh/authorized_keys
sudo chmod 600 /home/home/.ssh/authorized_keys
1sudo chmod 700 /home/home/.ssh
sudo echo "home ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users
sudo chown -R home:home /home/home

sudo useradd -m -d /home/work -s /bin/bash -G wheel work
sudo mkdir /home/work/.ssh
sudo echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLwclAWDYRPg0ZUqZjdckEW+4E5E4OGZSCPfPdr3/MGfSe+I+Q4ibrR7reQfGaVUSIrrFL2Cw83hbPWnv1WjGeQkQccY8x80BefAgKEmhbAFg4d9Y/O/wHsvDM4giupLJEJjBBPFjPZU3oXrd4GheVE4wfkRaJC3NaJVygc++WljfEC0/whyDAfwv5PZqKCs8ERCqlMJBUzB5roZnOXLP5vPsucaBJpHx5/0HGVFhnK9tsVwL1JWiClDW3oR8YdN+r0Sw/pJ1xW3aRxnT2+N/rqO3rZXYI5vNm1YJ0DtVeeCn3c5CUFqkJJ6vS+8SkyhumgQTKcF8pxvGcJSEt9j4j avial@darkstar' >> /home/work/.ssh/authorized_keys
sudo chmod 600 /home/work/.ssh/authorized_keys
sudo chmod 700 /home/work/.ssh
sudo echo "work ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users
sudo chown -R work:work /home/work


# sudo amazon-linux-extras install nginx1
sudo cp /etc/nginx /etc/nginx.old
# sudo mkdir /etc/nginx
sudo echo -e "events{}\n http {\n server {\n listen 8888;\n root /usr/share/nginx/html;\n location / {\n  index index.html; \n }\n }\n}" > /etc/nginx/nginx.conf

IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
REGION=$(curl http://169.254.169.254/latest/meta-data//placement/region)
AZ=$(curl http://169.254.169.254/latest/meta-data//placement/availability-zone)

sudo echo -e "<center><h2>IP: $IP</h2><br><h2>REGION: $REGION</h2><br><h2>AZ: $AZ</h2></center>" > /usr/share/nginx/html/index.html
sudo systemctl restart nginx 
