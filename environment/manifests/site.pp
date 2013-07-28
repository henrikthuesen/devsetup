Exec["apt-get-update"] -> Package <| |>

Exec {
    path => "/usr/bin:/usr/sbin:/bin",
    logoutput => on_failure,
}

exec { "apt-get-update" :
    command => "/usr/bin/apt-get update",
    unless => "test $(expr $(date +%s) - $(stat -c %Y /var/lib/apt/lists)) -lt 604800"
}

group { "puppet": ensure => "present" }

import 'nodes/*.pp'
