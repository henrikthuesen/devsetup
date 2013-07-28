class mono {
  
  package { 'mono-devel': ensure => present }
  package { 'monodoc-manual': ensure => present }
  
}
