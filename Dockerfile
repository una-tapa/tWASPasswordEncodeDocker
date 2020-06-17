# Dockerfile Sample

# Traditional WAS 
FROM  ibmcom/websphere-traditional:latest

# Bad jar that corrupts security.xml
COPY mysampleErrorDecrypt.jar /opt/IBM/WebSphere/AppServer/lib/ext

# Update JVM argument to enable custom encoding 
# RUN sed -i 's/genericJvmArguments="-Duser.country=US -Duser.language=en"/genericJvmArguments="-Duser.country=US -Duser.language=en -Dcom.ibm.wsspi.security.crypto.customPasswordEncryptionEnabled=true -Dcom.ibm.wsspi.security.crypto.customPasswordEncryptionClass=mysample.MySampleEncryption -Dcom.ibm.websphere.security.passwordEncoderDebug=true" /g' /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/config/cells/DefaultCell01/nodes/DefaultNode01/servers/server1/server.xml
RUN sed -i 's/genericJvmArguments=""/genericJvmArguments="-Duser.country=US -Duser.language=en -Dcom.ibm.wsspi.security.crypto.customPasswordEncryptionEnabled=true -Dcom.ibm.wsspi.security.crypto.customPasswordEncryptionClass=mysample.MySampleEncryption -Dcom.ibm.websphere.security.passwordEncoderDebug=true" /g' /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/config/cells/DefaultCell01/nodes/DefaultNode01/servers/server1/server.xml

# Enable trace for password encryption/decryption
RUN sed -i 's/startupTraceSpecification="[*]\+=info"/startupTraceSpecification="*=info:SASRas=all" /g' /opt/IBM/WebSphere/AppServer/profiles/AppSrv01/config/cells/DefaultCell01/nodes/DefaultNode01/servers/server1/server.xml





