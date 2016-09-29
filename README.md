# Kibana Docker Container
###### Customized Docker Container containing Kibana for use in Azure

EDIT_AND_RUNME.sh is a bash script that passes all arguments to docker-compose. Used to load variables and setup things

overrides.env file will be created on first run of EDIT_AND_RUNME.sh if one doesnt exist. This file is used to override variables and is not overwritten

Elasticsearch templates to be auto-loaded can be placed into build/fluentd/es_templates

Configuration files can go into build/fluentd/configs

Some Configuration Files are already included

