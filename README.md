# [Dockerhub Link](https://hub.docker.com/r/alkoclick/alpine-jdk11-nojdk)

# Alpine JDK without the JDK? What the hell?

_Sigh_ It's a long story. Let me summarise it in bullets:
- Alpine is a great base image, much smaller than any other (5mb vs 100-200mb for the next smallest distros)
- Alpine uses musl, not glibc, which the (Oracle and OpenJDK) JVM normally runs on
- Alpine images for Java 11 are... [a long story](https://github.com/docker-library/openjdk/issues/211)
- Jlink is this nifty little Java tool that allows you to bundle only the JDK modules you need and make a runnable that doesn't need a JDK
- You can do [multi stage builds](http://blog.gilliard.lol/2018/11/05/alpine-jdk11-images.html), but having different JREs for development and production is bound to lead to ugly debugging stories
- The nice people over at [AdoptOpenJDK dockerhub](https://hub.docker.com/r/adoptopenjdk/openjdk11) have done an excellent job building all the dependencies required for the JDK to run

# So you just made a Dockerfile that FROMs their image and removes the bundled JDK?

No, because due to Docker layers, that would still include 100mb of downloaded JDK, only to be unceremoniously thrown away at the next layer. I just took their dependencies part and run it on a clean alpine 3.9. If you know any ways to grab their Dockerfile automatically, filter the top part and apply it, I'm all ears!

# Do you plan on updating this?

Never trust a person to update what a machine can automate! This image will rebuild automatically on Dockerhub when its parent image (adoptopenjdk/openjdk11:alpine-jre) changes thanks to Dockerhub goodness

# I think this is an ok idea, but it could be better

Always open to feedback, requests, PRs!
