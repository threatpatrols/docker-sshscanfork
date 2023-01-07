# sshscanfork 
A fork from [mozilla/ssh_scan](https://github.com/mozilla/ssh_scan) with updates because the
original mozilla/ssh_scan project has been archived by Mozilla.

The original motivation for this fork was to update the dependencies that were causing package 
and container scanning to trigger alerts.

Given the upstream (Mozilla) project was archived 2022-11-09 this fork exists without being 
merged/pulled back into theirs.  To make it possible for others to use this new fork the 
original references to `github.com/mozilla` have been adjusted to `github.com/threatpatrols`

## Key Benefits
- **Minimal Dependencies** - Uses native Ruby and BinData to do its work, no heavy dependencies.
- **Not Just a Script** - Implementation is portable for use in another project or for automation of tasks.
- **Simple** - Just point `ssh_scan` at an SSH service and get a JSON report of what it supports and its policy status.
- **Configurable** - Make your own custom policies that fit your unique policy requirements.

## Versions
* 0.1.44 - this fork-version bumps the version from the upstream `0.0.44` to `0.1.44` without 
  any new ssh_scan functionality, the changes in this version are dependency and documentation updates.

## Setup

To run from Docker:
```bash
docker pull threatpatrols/sshscanfork
docker run -it threatpatrols/sshscanfork --help
```

To install and run from source:
```bash
# clone repo
git clone https://github.com/threatpatrols/sshscanfork.git
cd sshscanfork

gem install bundler
bundle install

./bin/ssh_scan --help
```

## Synopsis

```bash
ssh_scan v0.1.44 (https://github.com/threatpatrols/sshscanfork)

Usage: ssh_scan [options]
    -t, --target [IP/Range/Hostname] IP/Ranges/Hostname to scan
    -f, --file [FilePath]            File Path of the file containing IP/Range/Hostnames to scan
    -T, --timeout [seconds]          Timeout per connect after which ssh_scan gives up on the host
    -L, --logger [Log File Path]     Enable logger
    -O, --from_json [FilePath]       File to read JSON output from
    -o, --output [FilePath]          File to write JSON output to
        --output-type [json, yaml]   Format to write stdout to json or yaml
    -p, --port [PORT]                Port (Default: 22)
    -P, --policy [FILE]              Custom policy file (Default: Mozilla Modern)
        --threads [NUMBER]           Number of worker threads (Default: 5)
        --fingerprint-db [FILE]      File location of fingerprint database (Default: ./fingerprints.db)
        --suppress-update-status     Do not check for updates
    -u, --unit-test [FILE]           Throw appropriate exit codes based on compliance status
    -V [STD_LOGGING_LEVEL],
        --verbosity
    -v, --version                    Display just version info
    -h, --help                       Show this message

Examples:

  ssh_scan -t 192.168.1.1
  ssh_scan -t server.example.com
  ssh_scan -t ::1
  ssh_scan -t ::1 -T 5
  ssh_scan -f hosts.txt
  ssh_scan -o output.json
  ssh_scan -O output.json -o rescan_output.json
  ssh_scan -t 192.168.1.1 -p 22222
  ssh_scan -t 192.168.1.1 -p 22222 -L output.log -V INFO
  ssh_scan -t 192.168.1.1 -P custom_policy.yml
  ssh_scan -t 192.168.1.1 --unit-test -P custom_policy.yml
```

## Credits

#### Original Mozilla Project and all the Original Contributors
 - [github.com/mozilla/ssh_scan](https://github.com/mozilla/ssh_scan/graphs/contributors)
 - [all 27x mozilla/ssh_scan contributors](https://github.com/mozilla/ssh_scan/graphs/contributors)

#### Sources of Inspiration for ssh_scan
 - [Mozilla OpenSSH Security Guide](https://wiki.mozilla.org/Security/Guidelines/OpenSSH) - For providing a sane baseline policy recommendation for SSH configuration parameters (eg. Ciphers, MACs, and KexAlgos).
