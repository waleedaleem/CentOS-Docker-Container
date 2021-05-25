FROM centos:7
ENV PS1='[\u@\h \A] \W \$ '
ENV EDITOR=vim
ENV VISUAL=$EDITOR
RUN set -o vi
RUN alias ll='ls -alhtrGF'
RUN yum install -y java-11-openjdk-devel iproute net-tools which openssh-clients sshpass \
        && yum clean all
