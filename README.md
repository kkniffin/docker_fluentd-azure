# FluentD Azure Docker Container
###### Customized Docker Container containing Kibana for use in Azure

EDIT_AND_RUNME.sh is a bash script that passes all arguments to docker-compose. Used to load variables and setup things

overrides.env file will be created on first run of EDIT_AND_RUNME.sh if one doesnt exist. This file is used to override variables and is not overwritten

Elasticsearch templates to be auto-loaded can be placed into build/fluentd/es_templates

Configuration files can go into build/fluentd/configs

Some Configuration Files are already included

# Create CA Certificate
certtool --generate-privkey --bits 4096 --outfile nxlog-ca-key.pem
certtool --generate-self-signed --load-privkey nxlog-ca-key.pem --outfile nxlog-ca.pem
# Create Client Certificate & Sign it.
certtool --generate-privkey --outfile nxlog-client-key.pem --bits 4096
certtool --generate-request --load-privkey nxlog-ca-key.pem --outfile nxlog-client-request.pem
certtool --generate-certificate --load-request nxlog-client-request.pem --outfile nxlog-client-cert.pem --load-ca-certificate nxlog-ca.pem --load-ca-privkey nxlog-ca-key.pem 
rm -f nxlog-client-request.pem
# Copy
# nxlog-client-cert.pem
# nxlog-client-key.pem
# nxlog-ca-key.pem
