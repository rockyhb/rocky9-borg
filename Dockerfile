FROM rockylinux/rockylinux:9
ENV container docker
ADD https://github.com/borgbackup/borg/releases/download/1.2.3/borg-linux64 /usr/local/bin
ADD https://github.com/borgbackup/borg/releases/download/1.2.3/borg-linux64.asc /usr/local/bin
RUN \
  cd /usr/local/bin && \
  gpg --recv-keys "6D5B EF9A DD20 7580 5747 B70F 9F88 FB52 FAF7 B393" && \
  gpg --verify borg-linux64.asc && \
  chmod 0755 borg-linux64 && \
  ln -s borg-linux64 borg
CMD ["/bin/bash"]
