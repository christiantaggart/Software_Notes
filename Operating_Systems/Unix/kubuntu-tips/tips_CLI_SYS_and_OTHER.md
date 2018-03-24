### Shell commands:
(Throwing -h where I don't remember actual)

**Yakuake** is my terminal running oh-my-zsh
- `cmd ~` to open it

Shows what distro you are using
- `lsb_release -a`

Shows what linux kernel is being used.
- `uname -a`

CPU Temps and sensor data:
- `sensors -h`

GPU Info:
- `nvidia-smi -h`

Docker create and start docker images: (using docker-ce) not 100% sure on order
change into **/dir** with docker files (`<desired-file>.yml`)
`docker-compose -f <desired-file>.yml up` [docs](https://docs.docker.com/compose/reference/up/)
`docker-compose -f <image-name> create`
`docker-compose -f <image-name> start`

If you want to delete the running instance of said image[docs](https://docs.docker.com/engine/reference/commandline/rm/)
`docker-compose -f rm <image-name>`


---
### NON-CLI

Nvidia X Server Settings is my nVidia Tuning GUI:
  - Maxxed out with Graphics Clock Offset @ 186mhz
  - Maxxed out with Memory Transfer Rate  Offset @ 866mhz
_Gradually increase these in increments of 5-10_

intellij Early Access Program
- Need to re-install
