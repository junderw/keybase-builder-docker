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
