FROM gentoo/portage:latest AS portage
FROM gentoo/stage3:latest

WORKDIR /root

COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo
COPY 10-prepare-base .
RUN chmod 755 10-prepare-base && ./10-prepare-base

COPY 20-install packages .
RUN chmod 755 20-install && ./20-install

# Set default entry point to login shell, so that Gentoo's
# /etc/profile is sourced and we have, for example, clang in PATH.
ENTRYPOINT ["/bin/bash", "-l", "-c"]
