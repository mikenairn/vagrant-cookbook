#!/usr/bin/env bats

@test "vagrant binary is found in PATH" {
  run which vagrant
  [ "$status" -eq 0 ]
}

@test 'vagrant-aws plugin installed and correct version' {
    run sudo bash -l -c 'vagrant plugin list | grep "vagrant-aws (0.4.1)"'
    [ "$status" -eq 0 ]
}

@test 'vagrant-omnibus plugin installed and correct version' {
    run sudo bash -l -c 'vagrant plugin list | grep "vagrant-omnibus (1.4.1)"'
    [ "$status" -eq 0 ]
}
