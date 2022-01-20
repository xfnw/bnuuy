# bnuuy
little deployable firefoxes uwu

![Screenshot of bnuuy in action](https://camo.githubusercontent.com/902d81be7eaa2140dff77ab208edbacfad60ceb5598b0950ab2e6ef9d9f7be9e/68747470733a2f2f74746d2e73682f4677372e706e67)


at `568MB` its pretty big. most of that is firefox though.
you can omit some of the codecs and fonts to save like 50MB, but
then most webpages will be half-broken


this is essentially [bunny](https://github.com/SimplyLinn/bunny), [alpine-vnc](https://github.com/danielguerra/alpine-vnc),
and [spice-chrome](https://github.com/ikreymer/spice-chrome) shoved together into one alpine docker container


## build the image
clone the repo and go in it, then you can
```
docker build -t xfnw/bnuuy .
```

## running it
this is just an example, you probably want different flags for your usecase
```
docker run -p 5900:5900 -p 5800:5800 -it xfnw/bnuuy
```

in this example, you can point your web browser to 5800 or a spice client to 5900 


