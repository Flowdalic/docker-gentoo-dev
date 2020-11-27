FROM gentoo/stage3

COPY config /

COPY 10-prepare-base /
RUN chmod 755 /10-prepare-base && /10-prepare-base

COPY 20-install-stable /
RUN chmod 755 /20-install-stable && /20-install-stable
