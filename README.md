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
# Curl is weird about spaces
curl -G http://localhost/example-application/deploy --data-urlencode 'message=Application XYZ has been deployed'
```

## FAQ

**Can I run this in production?**  
_Sure_

**Can I run this across multiple servers?**  
_Yikes, really? Not without [adding a backend to the pubsub server](https://faye.jcoglan.com/ruby/engines.html)_.

**Why?**  
_Why not?_

## More

This application is also a simple example of:

* Using Docker [multistage builds](https://medium.com/kokster/fun-with-multi-stage-dockerfiles-7da7f11403d2) so one Dockerfile is used for both production and development.
* Using Faye with nginx/passenger for PubSub.
* Decent use of the [phusion/passenger-ruby Docker image](https://github.com/phusion/passenger-docker).

So, poke around if you're interested in those things.
