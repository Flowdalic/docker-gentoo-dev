FROM gentoo/portage:latest as portage
FROM gentoo/stage3:latest

WORKDIR /root

COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo
COPY 10-prepare-base .
RUN chmod 755 10-prepare-base && ./10-prepare-base

COPY 20-install packages .
RUN chmod 755 20-install && ./20-install

COPY 90-final .
RUN chmod 755 90-final && ./90-final
