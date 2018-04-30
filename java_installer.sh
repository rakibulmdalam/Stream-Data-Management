set -e
echo "looking for java run time...."

if java -version 2>&1 >/dev/null | grep -q "java version" ; then
  echo "jre found..."
else
  echo "jre not found"
  echo "adding java repo..."
  sudo add-apt-repository -y ppa:webupd8team/java
  echo "installing jre8"
  sudo apt update
  sudo apt install oracle-java8-installer -y || echo "could not install jre..."
fi
