FROM ubuntu:18.04

RUN apt-get update && apt-get install -y ca-certificates \
  bash \
  openssh-server \
  openssl \
  wget \
  dpkg \
  vim \
  gss-ntlmssp \
  iputils-ping

RUN wget https://github.com/PowerShell/PowerShell/releases/download/v6.2.1/powershell_6.2.1-1.ubuntu.18.04_amd64.deb
RUN dpkg -i --force-all powershell_6.2.1-1.ubuntu.18.04_amd64.deb
RUN apt-get install -f --yes
RUN wget -O - "https://github.com/vmware/govmomi/releases/download/v0.18.0/govc_linux_amd64.gz" | gunzip -c > /usr/local/bin/govc
RUN wget -O /usr/local/bin/om "https://github.com/pivotal-cf/om/releases/download/0.42.0/om-linux"

RUN chmod +x /usr/local/bin/om
RUN chmod +x /usr/local/bin/govc
