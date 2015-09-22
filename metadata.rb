name             "supu-chef"
maintainer       "Adrià Cidre"
maintainer_email "adria.cidre@gmail.com"
license          "Apache 2.0"
description      "Installs/configures supu.io"
version          "0.1.0"
recipe           "supu-chef::default", "Installs/configures supu.io"

depends 'apt'
depends 'redis'
depends 'golang'
