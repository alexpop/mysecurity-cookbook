name 'mysecurity-cookbook'
maintainer 'Alex Pop'
maintainer_email 'alex@example.com'
license 'All rights reserved'
description 'Security related dev & test'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.9.1'

depends 'ohai'

recipe 'mysecurity-cookbook::default', 'Deploy the ohai plugin and upgrade bash if vulnerable'
