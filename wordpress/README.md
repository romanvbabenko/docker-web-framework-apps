# Wordpress development environment example with Docker Compose

There are loads of tutorials which end up with WordPress Install Dialog and you should pass through it by yourself.
This example does everything for you and even a little bit more. Literally it sets up WordPress with MySQL and automatic customizable installer.
Despite it creates an isolated docker environment, you'll be able to test it outside without any further changes.
ATDD(Acceptance Testing Driven Development) is represented by a simple suit of features based on Capybara with Selenium Driver.
How to take off with all of this you can read below in the README.
On the other hand, .travise.yml script section ain't no forbidden for reading as well

## Set up

1. Clone or fork the repo
2. Add app.local to /etc/hosts, e.g:
```
127.0.0.1 app.local
```

## Start environment

```
docker-compose up -d app.local
```

It starts app.local and dependent db container in the background.
It may take some time to pull all the images by docker to your local machine.
Furthermore you should wait about 15 sec before you can connect you app.local.

## Install WordPress

```
docker-compose run --rm installer 
```

Now you can go to http://app.local on your browser and you'll see the very first page of installed WordPress Blog.
If you'd like to change some installation params, just take a look at environment ```WP_CORE_*``` variables of "installer" container.
Just like 
```
docker-compose run --rm install WP_CORE_TITLE="The WP Blog of Mine"
```

NOTE: In this case the testing suite will fail, because it expects another blog title. So you should change it as well.

## Running acceptance specs

```
docker-compose run --rm spec
```

By default the spec suite starts headless Firefox browser and tests accessibility of WordPress front page and then logs in with default admin credentials.
Nevertheless the site is still accessible from your host machine. So if you like, you can play with it and run tests from outside withot any changes.
But in this case you need Ruby, Firefox, and geckodriver installed in your system, just like "spec" image does it for you. 

## Shutdown environment

```
docker-compose down --volumes
```

It removes all the running containers and related volumes. However it does not remove pulled images. You should delete them on your own if it's required.
