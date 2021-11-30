FROM cypress/browsers:node14.7.0-chrome88-ff89

RUN sed -i -r -e 's|deb(-src)? http://security.debian.org jessie/updates main||g' /etc/apt/sources.list \
    && echo "deb http://ftp.de.debian.org/debian testing main" >> /etc/apt/sources.list \
    && apt-get update && apt-get install -y --no-install-recommends \
         libc6-dev \
         python3.9 \
         python3.9-dev \
         python3-pip \
         python3-setuptools \
         python3-wheel \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python3 python /usr/bin/python3.9 100 && python3 --version

RUN apt-get update && apt-get upgrade -y

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -

ENV PATH /root/.local/bin:$PATH

#RUN poetry --help # will be successful

#RUN poetry install # will succeed

CMD ["/bin/sh”]