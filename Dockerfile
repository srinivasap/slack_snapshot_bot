FROM centos:7

# Update OS, install Apache and supervisor
RUN yum -y --setopt=tsflags=nodocs update && \
    yum clean all && \
    yum install -y python-setuptools && \
    yum install -y gcc-c++ make && \
    easy_install supervisor

# CentOS Dependencies for puppeteer - https://github.com/puppeteer/puppeteer/blob/master/docs/troubleshooting.md
RUN yum install -y pango.x86_64 && \
    yum install -y libXcomposite.x86_64 && \
    yum install -y libXcursor.x86_64 && \
    yum install -y libXdamage.x86_64 && \
    yum install -y libXext.x86_64 && \
    yum install -y libXi.x86_64 && \
    yum install -y libXtst.x86_64 && \
    yum install -y cups-libs.x86_64 && \
    yum install -y libXScrnSaver.x86_64 && \
    yum install -y libXrandr.x86_64 && \
    yum install -y GConf2.x86_64 && \
    yum install -y alsa-lib.x86_64 && \
    yum install -y atk.x86_64 && \
    yum install -y gtk3.x86_64 && \
    yum install -y ipa-gothic-fonts && \
    yum install -y xorg-x11-fonts-100dpi && \
    yum install -y xorg-x11-fonts-75dpi && \
    yum install -y xorg-x11-utils && \
    yum install -y xorg-x11-fonts-cyrillic && \
    yum install -y xorg-x11-fonts-Type1 && \
    yum install -y xorg-x11-fonts-misc

# Install Node.js v10.x
RUN curl --silent --location https://rpm.nodesource.com/setup_10.x | bash - && yum -y install nodejs

# Command to establish http tunnel between slack apis and locally running app instance
RUN npm install -g ngrok

# Copy the supervisord.conf to the docker to bootstrap the server
RUN mkdir -p /app/
COPY app/ /app/

# Changing work dir
WORKDIR /app
# install app dependencies
RUN npm install --quiet

# Copy the supervisord.conf to the docker to bootstrap the server
COPY supervisord.conf /etc/supervisor/supervisord.conf

# Share the some directories of the docker with the Host such as apache root document, apache log
VOLUME ["/var/log/api"]

CMD ["/usr/bin/supervisord"]