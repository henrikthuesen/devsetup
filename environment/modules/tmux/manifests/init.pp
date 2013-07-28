class tmux() {

  package { "tmux":
    ensure => installed,
  }

  file { "/home/vagrant/.tmux.conf":
    source => "puppet:///modules/tmux/dot.tmux.conf",
    owner => "vagrant",
    group => "vagrant",
  }

}
