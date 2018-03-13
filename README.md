# Keybase builder Docker

## Build Image

```bash
docker build -t keybase-builder .
```

## Run to build

(pwd should be this repository)

```bash
docker run -v $(pwd)/files:/data -it keybase-builder /root/newbuild
```

## Run to move binaries from files folder to /usr /etc and /opt

```bash
bin/movefiles.sh ./files/20180309162432/
```
