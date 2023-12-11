# posd-environment

## Getting Started

1. Change directory into the target POSD project directory.
2. Use the command to build POSD projects:
   ```console
   docker run -it --rm --user ${UID} -v `pwd`:/code chris85618/posd
   ```

## Build Your Own Docker Image

1. docker build -t posd .
2. Change directory into the target POSD project directory.
3. Use the command to build POSD projects: `docker built -t chris85618/posd .`
