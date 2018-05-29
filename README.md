# Ahoy Deploy

A simple way of alerting a room to a deployment by [bringing the thunder](https://github.com/nodanaonlyzuul/Paul-Dix--Thundergod).  
Prepare to lose friends at the office.

## Installing Locally / Getting Running

1. `docker-compose build`
1. `docker-compose up`
1. Point browser to `http://localhost/example-application`
1. `curl http://localhost/example-application?message=deployed`

## Example

```
curl -G http://localhost/example-application/deploy --data-urlencode 'message=Application XYZ has been deployed'
```
