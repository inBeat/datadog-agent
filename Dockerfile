FROM gcr.io/datadoghq/agent:latest
ADD ./conf.yaml /etc/datadog-agent/conf.d/go.d/

# Environment Variables
ENV DD_DOGSTATSD_NON_LOCAL_TRAFFIC=true
ENV DD_LOGS_ENABLED=true
ENV DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true
ENV DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true
ENV DD_SITE=datadoghq.com
ENV DD_CONTAINER_EXCLUDE_LOGS="name:datadog-agent"

EXPOSE 8125

# Declare volumes to mount
#VOLUME [${LOG_DIR}]
