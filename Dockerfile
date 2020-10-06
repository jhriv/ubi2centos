FROM registry.redhat.io/ubi8/ubi:latest

ARG mirror=http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages
ARG ver=8.2-2.2004.0.2

LABEL author="John H. Robinson, IV <jhriv@ucla.edu>"
LABEL description="CentOS8 Base Image, based on UBI8"

# Remove RHEL
RUN rm \
  /etc/dnf/protected.d/redhat-release.conf \
  /etc/yum.repos.d/ubi.repo
RUN dnf remove --assumeyes \
  dnf-plugin-subscription-manager \
  redhat-release \
  subscription-manager

# Convert to CentOS
RUN dnf install --assumeyes --releasever=$ver \
  $mirror/centos-gpg-keys-$ver.el8.noarch.rpm \
  $mirror/centos-release-$ver.el8.x86_64.rpm \
  $mirror/centos-repos-$ver.el8.x86_64.rpm
RUN dnf reinstall --assumeyes \
  dbus-daemon \
  setup \
  shadow-utils \
  systemd

# Clean up RPM remnants
RUN dnf clean all
RUN find / -name \*.rpmnew -exec rm {} \; \
  -o -name \*.rpmsave -exec rm {} \;
