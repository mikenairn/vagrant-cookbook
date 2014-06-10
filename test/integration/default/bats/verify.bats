#!/usr/bin/env bats

@test "vagrant binary is found in PATH" {
  run which vagrant
  [ "$status" -eq 0 ]
}
