# E.g. run dc2 in a single public node in AWS
#
# DC1
# PUB_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
# DC1_GATEWAY_PUBLIC_IP=$PUB_IP DC1_SERVER_PUBLIC_IP=$PUB_IP ./dc.sh -f docker-compose-dc1.yml up
#
# DC2 (needs to manually know IP of dc1)
# PUB_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
# DC1_SERVER_PUBLIC_IP='1.2.3.4' DC2_GATEWAY_PUBLIC_IP=$PUB_IP DC2_SERVER_PUBLIC_IP=$PUB_IP ./dc.sh -f docker-compose-dc2.yml up

export DC1_SERVER_PUBLIC_IP=${DC1_SERVER_PUBLIC_IP:-'192.169.7.2'}
export DC1_GATEWAY_PUBLIC_IP=${DC1_GATEWAY_PUBLIC_IP:-'192.169.7.3'}
export DC2_SERVER_PUBLIC_IP=${DC2_SERVER_PUBLIC_IP:-'192.169.7.4'}
export DC2_GATEWAY_PUBLIC_IP=${DC2_GATEWAY_PUBLIC_IP:-'192.169.7.5'}

export DC1_SUBNET='10.5.0.0/16'
export DC1_SERVER_PRIVATE_IP='10.5.0.2'
export DC1_SERVICE_WEB_IP='10.5.0.3'
export DC1_SERVICE_CURRENCY_IP='10.5.0.4'
export DC1_GATEWAY_PRIVATE_IP='10.5.0.5'

export DC2_SUBNET='10.6.0.0/16'
export DC2_SERVER_PRIVATE_IP='10.6.0.2'
export DC2_SERVICE_PAYMENTS_IP='10.6.0.3'
export DC2_GATEWAY_PRIVATE_IP='10.6.0.5'

# To run full stack locally: ./dc up -f docker-compose-dc1.yml -f docker-compose-dc2.yml $@
docker-compose $@
