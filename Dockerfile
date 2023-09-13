# Use a base image that includes a Java runtime environment
FROM tomcat:8.0



# Copy the WAR file into the containercdcd

COPY target/*.jar /usr/local/tomcat/webapps/

# Expose the port your application listens on (e.g., 8080)
EXPOSE 8080

# Define the command to run your application when the container starts
CMD ["java", "-jar", "run"]

