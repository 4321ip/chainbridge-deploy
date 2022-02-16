# Copyright 2020 ChainSafe Systems
# SPDX-License-Identifier: LGPL-3.0-only

FROM golang:1.13-alpine

#ENV PK=$PK
#RUN echo 'WWWWWW'
#RUN echo $PK

RUN apk update && apk --no-cache add make git gcc musl-dev linux-headers
RUN     git clone -b v1.1.1 --depth 1 https://github.com/ChainSafe/chainbridge \
        && cd chainbridge \
        && make build

#ENTRYPOINT echo $PK && /bin/sh &&  echo 'asdasdasasd'

#CMD tail -f /dev/null

CMD cd /go/chainbridge && echo 'PK=' && echo $PK && \
    export KEYSTORE_PASSWORD="empty" && \
    build/chainbridge accounts import --privateKey $PK --password $KEYSTORE_PASSWORD && \
    build/chainbridge --config config.json --verbosity info --latest && \
    /bin/sh
