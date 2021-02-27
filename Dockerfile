FROM debian:stretch

RUN apt-get -qq update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends python-pygments git ca-certificates ruby \
	&& rm -rf /var/lib/apt/lists/* \
	&& gem install asciidoctor pygments.rb

ENV HUGO_VERSION 0.81.0
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.deb

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb \
	&& rm /tmp/hugo.deb
