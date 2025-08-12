# Limarka Template TCC
#
# A imagem base que é utilizada para a construção dessa imagem foi retirada do repositório oficial do Limarka.
# Essa é uma versão que tem algumas pequenas customização para atualizar algumas dependências dentro da imagem oficial.
# https://github.com/abntex/limarka/blob/master/containers/alphine-ruby-latex-pandoc.dockerfile
#
# @document https://reinanhs.github.io/limarka-template-docs/

ARG ALPINE_VERSION=3.22

FROM alpine:$ALPINE_VERSION

LABEL maintainer="ReinanHS <reinangabriel1520@gmail.com>" version="1.0" license="MIT"

##
# ---------- env settings ----------
##
# --build-arg timezone=America/Sao_Paulo
ARG timezone
ARG PANDOC_VERSION=3.7.0.2
ARG LIMARKA_VERSION=20.7.13.pre.365

ENV TIMEZONE=${timezone:-"America/Sao_Paulo"} \
    LANG=pt_BR.UTF-8 \
    LANGUAGE=pt_BR.UTF-8 \
    LC_ALL=pt_BR.UTF-8

##
# ---------- building ----------
##
RUN set -ex \
    && apk update \
    && apk add --no-cache \
    alpine-sdk \
    build-base \
    fontconfig \
    pdfgrep \
    perl \
    perl-io-socket-ssl \
    perl-net-ssleay \
    ca-certificates \
    openssl \
    poppler-utils \
    ruby-dev \
    ruby \
    unzip \
    wget \
    git

# Instala Tinytex (https://yihui.name/tinytex/)
ADD https://yihui.name/gh/tinytex/tools/install-unx.sh /tmp/

RUN CTAN_REPO="https://mirror.ctan.org/systems/texlive/tlnet" sh /tmp/install-unx.sh
ENV PATH="/root/bin:${PATH}"

# Instala bibliotecas para o abntex2/limarka
RUN tlmgr install \
  abntex2 \
  babel-portuges \
  bookmark \
  caption \
  enumitem \
  epstopdf-pkg \
  iftex \
  lastpage \
  lipsum \
  listings \
  memoir \
  microtype \
  oberdiek \
  pdflscape \
  pdfpages \
  psnfss \
  shipunov \
  texliveonfly \
  textcase \
  xcolor \
  xpatch \
  titlesec \
  subfigure \
  geometry \
  graphics \
  url \
  hyphen-portuguese \
  hyperref \
  collection-fontsrecommended

# Configurando o idioma português
ENV MUSL_LOCALE_DEPS cmake make musl-dev gcc gettext-dev libintl
ENV MUSL_LOCPATH /usr/share/i18n/locales/musl

RUN apk add --no-cache \
  $MUSL_LOCALE_DEPS \
  && wget https://gitlab.com/rilian-la-te/musl-locales/-/archive/master/musl-locales-master.zip \
  && unzip musl-locales-master.zip \
  && cd musl-locales-master \
  && cmake -DLOCALE_PROFILE=OFF -D CMAKE_INSTALL_PREFIX:PATH=/usr . && make && make install \
  && cd .. && rm -r musl-locales-master

ENV LANG pt_BR.UTF8

# Instalação do pandoc
RUN wget -O pandoc.tar.gz "https://github.com/jgm/pandoc/releases/download/$PANDOC_VERSION/pandoc-$PANDOC_VERSION-linux-amd64.tar.gz" \
  && tar xvzf pandoc.tar.gz --strip-components 1 -C /usr/local/ && rm pandoc.tar.gz

RUN gem update --system 3.5.9 
RUN gem install limarka --pre -v $LIMARKA_VERSION && gem update uri && gem update rdoc
RUN gem uninstall uri

RUN echo -e "\033[42;37m Build Completed :).\033[0m\n"

RUN apk del ruby-dev build-base wget alpine-sdk unzip cmake make musl-dev curl

WORKDIR /trabalho

ENTRYPOINT ["limarka", "--version"]