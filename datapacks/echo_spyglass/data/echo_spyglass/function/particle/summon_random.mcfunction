$execute store result storage echo_spyglass:particle x double 0.1 run random value -$(range)..$(range)
$execute store result storage echo_spyglass:particle y double 0.1 run random value 0..$(range)
$execute store result storage echo_spyglass:particle z double 0.1 run random value -$(range)..$(range)
$data modify storage echo_spyglass:particle id set value $(id)
function echo_spyglass:particle/summon_positioned with storage echo_spyglass:particle