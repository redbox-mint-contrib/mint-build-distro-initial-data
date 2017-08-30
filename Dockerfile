FROM qcifengineering/mint
RUN wget -O /tmp/mint-build-distro-initial-data-1.2-1.noarch.rpm http://dev.redboxresearchdata.com.au/yum/releases/mint-build-distro-initial-data-1.2-1.noarch.rpm
RUN rpm2cpio /tmp/mint-build-distro-initial-data-1.2-1.noarch.rpm | cpio -idmv
RUN tar xvfz /opt/mint/mint-build-distro-initial-data.tar.gz
CMD /opt/mint/server/tf_fg.sh
