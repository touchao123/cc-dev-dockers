FROM chao123/someip-base

ARG USERNAME=jlr
ARG PASSWORD=jlr

RUN groupadd jlr
RUN useradd -d /home/$USERNAME -ms /bin/bash -g jlr -G sudo $USERNAME
RUN echo "$USERNAME:$PASSWORD" | chpasswd

RUN apt-get -y install boxes
RUN apt-get -y install cowsay fortune

RUN echo "\n  \
export PS1='\[\e[32;7m\][\u@\h \w]\$ \[\e[m\]' \n\
clear \n\
echo ' JLR V2X Development Environment ' | boxes -d columns -ac -s 46x6 \n\
echo '~~~ Have fun!' \n\
/usr/games/fortune | /usr/games/cowsay -W 55 -e @@ -T ~~\n\
echo -e \n\
echo -e \n\
cd ~ " \
>> /home/$USERNAME/.bashrc

RUN mkdir -p /home/$USERNAME/v2x

RUN mkdir -p /var/run/sshd

RUN apt-get update
RUN apt-get install -y pip  \
	clang  \
	clang-format \
	valgrind \
	xmlstarlet \
	g++ \
	ninja-build \
	python3-pip \
	pkg-config


RUN pip3 install --upgrade conan==1.59.0 cmakelint==1.4.2 cmake>=3.15
RUN pip3 install --upgrade gcovr --user

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN chown -R $USERNAME: /home/$USERNAME

COPY Dockerfile /home/$USERNAME/
COPY lazygit /usr/local/bin/
COPY cpolar /bin/

EXPOSE 22
CMD  ["/usr/sbin/sshd", "-D"]
