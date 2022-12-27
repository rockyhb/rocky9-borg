FROM rockylinux/rockylinux:9
LABEL description="Borg Backup based on RockyLinux 9"
LABEL org.opencontainers.image.authors="claas@rockbu.de"
ENV BORG_VERSION=${BORG_VERSION:-1.2.3}
ENV container docker
ADD https://github.com/borgbackup/borg/releases/download/${BORG_VERSION}/borg-linux64 /usr/local/bin
ADD https://github.com/borgbackup/borg/releases/download/${BORG_VERSION}/borg-linux64.asc /usr/local/bin
RUN \
  dnf -y update && dnf -y install --nodocs libxcrypt-compat mysql postgresql && dnf clean all && \
  cd /usr/local/bin && \
  gpg --recv-keys "6D5B EF9A DD20 7580 5747 B70F 9F88 FB52 FAF7 B393" && \
  gpg --verify borg-linux64.asc && \
  chmod 0755 borg-linux64 && \
  ln -s borg-linux64 borg && \
  ln -s borg-linux64 borgfs
CMD ["borg"]
ARG ["--help"]
