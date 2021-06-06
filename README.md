[![Actions Status - Master](https://github.com/juju4/ansible-flamegraph/workflows/AnsibleCI/badge.svg)](https://github.com/juju4/ansible-flamegraph/actions?query=branch%3Amaster)
[![Actions Status - Devel](https://github.com/juju4/ansible-flamegraph/workflows/AnsibleCI/badge.svg?branch=devel)](https://github.com/juju4/ansible-flamegraph/actions?query=branch%3Adevel)

# Flamegraph ansible role

A simple ansible role to setup and execute flamegraph
http://www.brendangregg.com/flamegraphs.html
https://github.com/brendangregg/FlameGraph

If looking for a nice GUI
https://www.kdab.com/hotspot-gui-linux-perf-profiler/

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.0
 * 2.3

### Operating systems

Tested with vagrant on Ubuntu 14.04, Kitchen test with trusty and centos7

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.flamegraph
```

Output file can easily be retrieve with command like
```
$ ansible -i localhost, localhost -c local -m fetch -a "src=/tmp/perf/out.svg dest=."
```


## Variables

Nothing specific for now.

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).

Once you ensured all necessary roles are present, You can test with:
```
$ cd /path/to/roles/flamegraph
$ kitchen verify
$ kitchen login
```
or
```
$ cd /path/to/roles/flamegraph/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues

* Under travis, it seems kernel permissions prevent to do capture.

* ```perf script``` seems to require a tty which maps to -t/-tt in ssh_args of ansible.cfg.
Sadly, -t resulted in same message (```incompatible file format (rerun with -v to learn more)```) and -tt is just stalling at gathering facts.
Only workaround, execute last command through interactive shell :(
```
ssh host
cd /tmp/perf && perf script | /opt/flamegraph/stackcollapse-perf.pl --kernel | /opt/flamegraph/flamegraph.pl --color=java > /tmp/perf/out.svg
```
or through ssh -t
```
ssh -t host 'cd /tmp/perf && perf script | /opt/flamegraph/stackcollapse-perf.pl --kernel | /opt/flamegraph/flamegraph.pl --color=java > /tmp/perf/out.svg'
```

* collecting events through systemtap & ktap are not functional either, at least on Xenial


## License

BSD 2-clause
