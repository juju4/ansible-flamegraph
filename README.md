[![Build Status - Master](https://travis-ci.org/juju4/ansible-flamegraph.svg?branch=master)](https://travis-ci.org/juju4/ansible-flamegraph)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-flamegraph.svg?branch=devel)](https://travis-ci.org/juju4/ansible-flamegraph/branches)
# Flamegraph ansible role

A simple ansible role to setup and execute flamegraph
http://www.brendangregg.com/flamegraphs.html
https://github.com/brendangregg/FlameGraph

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.0

### Operating systems

Tested with vagrant on Ubuntu 14.04, Kitchen test with trusty and centos7

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - flamegraph
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
* perf.data conversion fails sometimes with "ERROR: No stack counts found"

## License

BSD 2-clause

