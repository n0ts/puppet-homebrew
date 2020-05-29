# Public: Variables for working with Homebrew
#
# Examples
#
#   require homebrew::config

class homebrew::config {
  include boxen::config

  $cachedir     = "${boxen::config::cachedir}/homebrew"
  $installdir   = $::homebrew_root
  $libdir       = "${installdir}/lib"

  $cmddir       = "${installdir}/Library/Homebrew/cmd"
  $tapsdir      = "${installdir}/Library/Taps"

  $brewsdir     = "${tapsdir}/boxen/homebrew-brews"

  # version 2.2.17
  $min_revision = 'ca5eac845dc11e991d7d8f8c85aebb82dd454f37'
}
