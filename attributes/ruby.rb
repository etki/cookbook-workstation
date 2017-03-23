default['workstation']['ruby']['versions'] = %w(2.0 2.1 2.2 2.3 2.4)
default['workstation']['ruby']['gems'] = %w(jekyll capistrano thin unicorn bundler)
default['rvm']['install_pkgs'] = %w{sed grep tar gzip bzip2 bash curl git-core}
normal['rvm']['installer_url']= 'https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer'
