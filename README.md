# ez-jenkins [![npm version](https://badge.fury.io/js/ez-jenkins.svg)](https://www.npmjs.com/package/ez-jenkins)

> Easy CLI for Jenkins

```sh
npm install -g ez-jenkins
```

## features

- `tail` a job for new build logs indefinitely

## usage

```
$ jenkins
Usage: jenkins <command> [options]

Commands:
  tail    read build logs
```

```
$ jenkins tail -h
Usage: jenkins tail [options] <job-name>

Options:
  -f, --follow  follow a job's build logs indefinitely (think tail -f)
  -b, --build   show output for a specific build
```
