FROM ubuntu:22.04 as base

# install stuff
RUN apt update \
    && apt install -y sudo \
    && apt install -y systemd

RUN apt install -y openssh-server

# create dev_user with password
RUN useradd -m -s /bin/bash dev_user
RUN yes password | passwd dev_user
RUN adduser dev_user sudo
RUN mkdir -p /etc/sudoers.d
RUN echo $(ls -la /etc)
RUN echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/sudo

COPY .devcontainer/ssh-entrypoint.sh /
RUN chmod +x ssh-entrypoint.sh \
    && systemctl enable ssh \
    && mkdir /var/run/sshd

USER dev_user

RUN mkdir -p /home/dev_user/.ssh

ENTRYPOINT ["/ssh-entrypoint.sh"]
CMD ["sudo, /usr/sbin/sshd", "-D"]