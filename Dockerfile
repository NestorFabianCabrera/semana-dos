FROM nginx:latest

RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN mkdir -p /root/.ssh
RUN chmod 700 /root/.ssh
RUN echo 'root:test' | chpasswd

# COPY authorized_keys /root/.ssh/authorized_keys
#RUN chmod 600 /root/.ssh/authorized_keys

COPY ./sshd_config /etc/ssh/sshd_config


EXPOSE 80 2222

CMD ["sh", "-c", "service ssh start && nginx -g 'daemon off;'"]
