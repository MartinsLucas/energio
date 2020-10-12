FROM lucasmartins465/ubuntu-gdal:0.2.0

ENV TZ=UTC

ENV DEBIAN_FRONTEND=noninteractive

RUN   apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       curl \
                       git

COPY . /tcc-poc

WORKDIR /tcc-poc

CMD ["sh","scripts/test.sh"]