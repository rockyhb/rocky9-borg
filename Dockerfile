FROM rockylinux/rockylinux:9
ENV container docker
ADD https://github.com/borgbackup/borg/releases/download/1.2.3/borg-linux64.tgz /usr/local/bin
CMD ["/bin/bash"]
