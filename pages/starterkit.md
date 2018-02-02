---
layout: default
title: StarterKit
header: true
body_class: api
---

# Tankwars starter kit

This is a way to get started faster with building your first tank for the [Boston Mob Programming Conference Tank War](http://www.marcusoft.net/tankwars)

## Prerequisites
You, or at least the computer your mob is using, need Docker installed to take part in the workshop. This will minimize the impact on your machine and stream-line the process for me.

Install [Docker](https://www.docker.com/community-edition) here. Before you go to workshop.

## Get your first tank shooting in minutes

1. Download the [starter-kit from here](https://www.dropbox.com/s/zubuww9r5wn9hei/tankwars-starter-kit.zip?dl=0)

2. Unzip it to a suitable location `/projects/tankwars-starter-kit` for example

3. Open a terminal / command prompt in that directory

4. run the following commands
  1. `docker build -t tankwars .`
  2. *{wait for ca 250 mb to download}*
  3. `docker exec -it tankwars /bin/bash `

5. That have put you inside a shiny new docker container. You will see something like `root@205c2a318c6f:/tank#` and a blinking prompt

6. Your tank is deployed! It's simple (just fires without moving), but it exists.

   1. The URL to your tank has been printed in the terminal. You can see it in the last output. It looks something, but not exactly, like this:

      ```javascript
        "api": {
          "id": "dijyb021g4",
          "module": "api",
          "url": "https://dijyb021g4.execute-api.us-east-1.amazonaws.com/latest"
        }
      ```

   2. **That url is important** - so make a note of it.

   3. You can always see it again by typing `cat claudia.json`

7. Let's make some changes and redeploy.

8. Open a text editor to the directory where you unzipped the file `/projects/tankwars-starter-kit` for example

9. Edit the name of the tank and your team in the `api.js`-file

   ```javascript
   api.get('/info', function () {
     return {
       name: '[your cool tank name here]', // <== Change this string
       owner: '[your team name]' // <== Change this string
     }
   })
   ```

10. Once you saved that file, go back to the terminal / command prompt in the container (`root@205c2a318c6f:/tank#`) and deploy your change `npm run deploy`

11. And now you are ready to go to Tank War!

Now iterate over the code in the. `api.post('/command', function (req) {`-function, because right now you tank is just firing and will become a sitting duck for the other mobs tanks. Go! Go! Go!


## Test your tank

There's an extensive testing feature of the [TankWars website](http://www.marcusoft.net/tankwars/). Head there to [test all different commands](http://www.marcusoft.net/tankwars/pages/test.html) of your tank.

## Running a game

Once you have tank you want to try out, head to [The Arena](http://www.marcusoft.net/tankwars/pages/match.html) and enter your tank URL. You can compete against yourself (enter the url twice) or against someone else, entering their url.

## Documentation

The [API is well documented](http://www.marcusoft.net/tankwars/pages/api.html) and can be found here

## If you want to clean up after the workshop

stop all containers:
`docker kill $(docker ps -q)`

remove all containers
`docker rm $(docker ps -a -q)`

remove all docker images
`docker rmi $(docker images -q)`



docker kill $(docker ps -q) && docker rm $(docker ps -a -q)