sudo yum -y upgrade

echo "--- install java ---"
yes | sudo yum install java-21-amazon-corretto.x86_64
yes | sudo yum install java-21-amazon-corretto-devel.x86_64

echo "--- install gradle ---"
sudo wget https://services.gradle.org/distributions/gradle-8.5-bin.zip
#설치 디렉토리 생성
sudo mkdir /opt/gradle
#압축 해제
sudo unzip -d /opt/gradle gradle-8.5-bin.zip
export PATH=$PATH:/opt/gradle/gradle-8.5/bin

echo "--- install git ---"
sudo yum install git -y
git init
git add remote origin git@github.com:jinkwangkim/trainner.git

echo "--- install docker ---"
sudo yum -y install docker

echo "--- clone source ---"
git clone git@github.com:jinkwangkim/trainner.git

echo "--- start docker ---"
sudo service docker start

echo "--- add user ec2-user ---"
sudo usermod -aG docker ec2-user

echo "--- install docker-compose ---"
curl -s https://get.docker.com/ | sudo sh
sudo wget -O /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/1.23.2/docker-compose-Linux-x86_64

echo "--- chmod docker-compose ---"
sudo chmod +x /usr/local/bin/docker-compose

echo "--- check install docker-compose ---"
docker-compose version 1.23.3, build 661ac20e

echo "--- install gradle(docker) ---"
sudo wget https://services.gradle.org/distributions/gradle-8.5-bin.zip
#설치 디렉토리 생성
sudo mkdir /opt/gradle
#압축 해제
sudo unzip -d /opt/gradle gradle-8.5-bin.zip
export PATH=$PATH:/opt/gradle/gradle-8.5/bin

echo "--- src root ---"
gradle wrap

echo "--- build ---"
./gradlew bootWar


echo "--- start docker ---"
sudo service docker start && docker-compose up -d