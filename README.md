# bnuuy
little deployable firefoxes uwu

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
docker run -p 5900:5900 -p 5959:5959 -it xfnw/bnuuy
```



