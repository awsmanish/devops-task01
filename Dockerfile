FROM ubuntu
RUN apt update -y && apt install git -y
RUN git clone https://github.com/shashirajraja/onlinebookstore.git
RUN apt install maven -y
RUN cd onlinebookstore/ && mvn clean package
RUN apt install wget -y
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz
RUN tar -xvf apache-tomcat-9.0.78.tar.gz -C /opt/
RUN cd onlinebookstore/target/ && mv onlinebookstore.war /opt/apache-tomcat-9.0.78/webapps/
RUN cd /opt/apache-tomcat-9.0.78
EXPOSE 8080/tcp
CMD ./opt/apache-tomcat-9.0.78/bin/startup.sh; sleep inf