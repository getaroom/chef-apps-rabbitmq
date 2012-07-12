name             "apps-rabbitmq"
maintainer       "getaroom"
maintainer_email "devteam@roomvaluesteam.com"
license          "MIT"
description      "Configures RabbitMQ for Apps"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))
version          "1.0.0"

depends "rabbitmq", ">= 1.2"

supports "debian"
supports "ubuntu"

recipe "apps-rabbitmq", "Configure RabbitMQ vhosts and user permissions"
