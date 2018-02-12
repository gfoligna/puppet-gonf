class puppet_gonf {

  $packages = [ 'google-chrome-stable', 'chromium-browser', 'wget', 'curl', 'tmux', 'vim', 'tlp', 'thinkfan', 'git', 'htop', 'lm-sensors', 'nmon' ]

  file { 'google-chrome.list':
    path    => '/etc/apt/sources.list.d/google-chrome.list',
    ensure  => present,
    source  => 'puppet:///modules/puppet_gonf/google-chrome.list',
    require => Apt::Key['4CCA1EAF950CEE4AB83976DCA040830F7FAC5991'],
    notify  => Exec['apt_update'],
  } ->

  package { 'install necessary packages':
    ensure => latest,
    name   => $packages,
  }
