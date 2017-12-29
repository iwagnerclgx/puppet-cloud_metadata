# Cloud_metadata

#### Table of Contents

1. [Description](#description)
1. [Reference](#reference)
1. [Examples](#examples)

## Description

This module exposes facts from data that you can pass .


## Reference

* [Facts](#facts)

### Facts

#### `cloud_meta_facts`

Hash of cloud_meta_facts if present. See examples for how to pass data correctly.

### Examples

#### Constructing Data

The facts should be a Base64 encoded JSON string prepended by cloud_meta_facts= in the cloud providers method of setting instance metadata.
 * Linux:
 ```
 $ echo cloud_meta_facts=`echo '{"mykey": "myvalue"}' | base64 -w0`
 cloud_meta_facts=eyJteWtleSI6ICJteXZhbHVlIn0K
 ```

 * Terraform:
```
"cloud_meta_facts=${base64encode(jsonencode(map("mykey", "myvalue")))}"
```

### Cloud Providers

 * AWS: Add string to Instance Userdata. You can add a # to treat the data as a comment if including it with a script.
