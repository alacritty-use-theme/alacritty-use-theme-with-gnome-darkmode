FROM ubuntu:latest
# Install Packages
RUN apt-get update \
  && apt-get install -y \
  build-essential \
  vim \
  redshift \
  systemd \
  dbus \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash admin
COPY --chown=admin /app/var /var

WORKDIR /home/admin
# USER admin
COPY --chmod=0777 /app/home/ /home/admin/
ENV lat='' lng=''
# ENTRYPOINT ["/home/admin/.local/night-and-day/runner.sh"]
CMD ["bash", "/home/admin/.local/night-and-day/runner.sh"]
