FROM ubuntu:22.04
RUN apt-get update && \
apt-get install -y maven default-jdk git tomcat9
RUN git clone https://github.com/jenkinsci/jenkins.git
RUN cd jenkins
RUN mvn -f /jenkins/pom.xml clean package
RUN cp /jenkins/war/target/jenkins.war /var/lib/tomcat9/webapps/
EXPOSE 8081
RUN cd  /var/lib/tomcat9/webapps/
CMD ["java", "-jar", "jenkins.war", "--httpPort=8081"]

