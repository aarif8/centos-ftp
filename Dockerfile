FROM 		centos:7
MAINTAINER 	aarif@ilg.cat

RUN		yum update -y && \ 
		yum install -y vsftpd wget tar bzip2 unzip

RUN		{ echo 'anonymous_enable=YES'; \
		echo 'write_enable=YES'; \
		echo 'pasv_enable=YES'; \
		echo 'pasv_min_port=10100'; \
		echo 'pasv_max_port=10200'; \
		echo 'allow_writeable_chroot=YES'; \
		} > /etc/vsftpd/vsftpd.conf

RUN 		echo 'alias ls="ls --color"' >> ~/.bashrc \
		&& echo 'alias ll="ls -lh"' >> ~/.bashrc \
		&& echo 'alias la="ls -lha"' >> ~/.bashrc

RUN		yum clean all && rm -rf /tmp/yum*

EXPOSE		20 21

CMD		["/usr/sbin/vsftpd","-obackground=NO"]
