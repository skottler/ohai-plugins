# ohai-plugins
A collection of Ohai plugins, mostly related to hardware introspection.

### trim

This plugin detects support for
[TRIM](https://en.wikipedia.org/wiki/Trim_%28computing%29) and adds information
about support for each underlying block device to `node["block_device"]`. For
example:

```json
"sda": {
  "size": "$SIZE",
  "removable": "0",
  "model": "$MODEL",
  "rev": "$REV",
  "state": "running",
  "timeout": "90",
  "vendor": "$VENDOR",
  "trim": false
},
"sdb": {
  "size": "$SIZE",
  "removable": "0",
  "model": "$MODEL",
  "rev": "$REV",
  "state": "running",
  "timeout": "30",
  "vendor": "$VENDOR",
  "trim": true
},
"sdc": {
  "size": "$SIZE",
  "removable": "0",
  "model": "$MODEL",
  "rev": "$REV",
  "state": "running",
  "timeout": "30",
  "vendor": "$VENDOR",
  "trim": true
},
```
