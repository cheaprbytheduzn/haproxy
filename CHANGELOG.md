## v1.1.0:

* [COOK-1275] - haproxy-default.erb should be a cookbook_file
* [COOK-1594] - Template-Service ordering issue in app_lb recipe

## v1.0.6:

* [COOK-1310] - redispatch flag has changed

## v1.0.4:

* [COOK-806] - load balancer should include an SSL option
* [COOK-805] - Fundamental haproxy load balancer options should be configurable

## v1.0.3:

* [COOK-620] haproxy::app_lb's template should use the member cloud private IP by default

## v1.0.2:

* fix regression introduced in v1.0.1

## v1.0.1:

* account for the case where load balancer is in the pool

## v1.0.0:

* Use `node.chef_environment` instead of `node['app_environment']`