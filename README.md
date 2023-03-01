tf-whitelist, A simple IP whitelist helper
==============================================

Help to manage simple IP whitelist with native terraform module.It can be used by other terraform modules such as security group ones, easy to build and maintenance IP rules.

## Input

* IP whitelist by yml file
* environment, for example, dev | prd, defined in whitelist 
* source services list, also defined in whitelist
* global as a special environment to append to all environment if the service present in source_services, use includ_global = false to exclude global appending

### The IP whitelist data structure

```yaml
env:
  service-name:
    - ip-cidr
    - ip-cidr
  service-name2:
    - ip-cidr
    - ip-cidr
env2:
  service-name:
    - ip-cidr
    - ip-cidr
global:
  serviceA:
    - ip-cidr
    - ip-cidr
```

## Usage

You are recommended to create local module with a maintenance IP whitelist, get different IPs list by different module instance of this module, for more details about usage, go to examples/ folder as reference.
