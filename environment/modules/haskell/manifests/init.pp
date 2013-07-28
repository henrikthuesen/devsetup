class haskell {
  
  package { 'ghc': ensure => present }
  package { 'cabal-install': ensure => present }
  package { 'happy': ensure => present }
  package { 'alex': ensure => present }

  # TODO: install hsenv
  
}
