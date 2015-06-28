FROM btimperman/monstra-cms

ENV PORT 3000
EXPOSE 3000

RUN curl -sL https://deb.nodesource.com/setup | bash - && \
    apt-get install -y git nodejs build-essential && \
    rm -r /var/lib/apt/lists/*

WORKDIR /

RUN git clone https://github.com/timperman/node-monstra.git

WORKDIR node-monstra

RUN npm install

COPY map-entry.sh /bin/map-entry.sh
RUN chmod +x /bin/map-entry.sh

COPY public /node-monstra/public
COPY views /node-monstra/views

ENTRYPOINT [ "/bin/map-entry.sh" ]
