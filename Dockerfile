FROM lucasmartins465/ubuntu-gdal:0.2.0

ENV TZ=UTC

ENV DEBIAN_FRONTEND=noninteractive

# Essential Linux packages
RUN apt-get update -qq && apt-get install -y build-essential \
                                             ruby-dev libpq-dev \
                                             curl git yarn cron \
                                             nodejs nano less

# Dependencies for rgeo
RUN apt-get --no-install-recommends -y install libproj-dev libgeos-dev

# Add libgeos symlinks for rgeo gem to be able to find it
#RUN ln -sf /usr/lib/libgeos-* /usr/lib/libgeos.so && ln -sf /usr/lib/libgeos-* /usr/lib/libgeos.so.1

COPY . /energio

WORKDIR /energio

CMD ["sh","scripts/start.sh"]