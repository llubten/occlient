FROM registry.access.redhat.com/ubi8/ubi

LABEL io.k8s.description="OCP Cleanup" \
      io.k8s.display-name="OCP Cleanup"

ENV PATH=$PATH:/usr/local/bin

ADD include/prune-ocp-projects.sh /usr/local/bin/

RUN env
RUN NO_PROXY=$NO_PROXY,downloads-openshift-console.apps.de3.osh.bgn
RUN curl --insecure https://downloads-openshift-console.apps.de3.osh.bgn/amd64/linux/oc.tar | tar -C /usr/local/bin/ -xf - ; \
    chmod +x /usr/local/bin/prune-ocp-projects.sh ; ls -rtl /usr/local/bin/ ; /usr/local/bin/oc

CMD [ "/usr/local/bin/prune-ocp-projects.sh" ]
