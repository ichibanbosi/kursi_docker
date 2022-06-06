FROM ubuntu:22.04
RUN apt-get update && \
apt-get install -y maven default-jdk git tomcat9
RUN git clone https://github.com/jenkinsci/jenkins.git && cd jenkins
RUN mvn clean install -Denforcer.fail=false
RUN cp ./war/target/jenkins.war /var/lib/tomcat9/webapps/
EXPOSE 8081
RUN cd  /var/lib/tomcat9/webapps/
CMD ["java", "-jar", "jenkins.war", "--httpPort=8081"]

