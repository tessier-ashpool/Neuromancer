module VConfig
  # Main container of the variables.
   $config = {
   	  default_box:      'hashicorp/precise64'
      hostname:         'neuromancer.dev'
      vm_name:          'neuromancer'
      # General configuration
      server_ip:        '192.168.22.10'
      port:             8080, # Perhaps you fancy different port?
      ram:              '1024', # Amount of RAM allowed for this machine.
      cpus:             '2'

      # Apache2/Nginx
      service:          'apache2', # nginx|apache2
      index:            'index.html', # What file should be read.
      server_admin:     'webmaster@localhost', # E-mail address for the admin. Fake will do...
      logs_dir:         '/vagrant/logs', # Server side path to logs.
      root_dir:         '/vagrant/web', # Local side path to the project content.

      # MySQL
      database:         'mysql', # Select database software, one of mariadb/mysql. Write "none" to disable installation.
      db_password:      'root', # Which password should be set up for the root user of database?

      # NodeJS
      nodejs:           true, # Would you like to install NodeJS in your environment?

      # Ruby/RoR
      install_ruby:     false, # Should we install ruby?

      ruby_version:     '2.0.0', # What version of ruby should be installed?

      rails:            false, # Should we install Ruby on Rails?

      rails_ver:        '', # What version of rails should it go with? Leave empty for default.

      # Sendmail/mailcatcher
      mailcatcher:      true, # Would you like to install MailCatcher?
      sendmail:         false, # Do you wish to include sendmail to your box?

      # Compass
      compass:          false, # Are you so cool to use compass with sass?
      compass_project:  '', # Direct us to the main directory of your compass project, so we can put the watch on!
  }
end