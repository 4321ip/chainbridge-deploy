set -a; source ../chainbridge.env; set +a

cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 admin add-relayer \
    --relayer $RELAYER_ADDR2 \
    --bridge $BRIDGE
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 admin add-relayer \
    --relayer $RELAYER_ADDR2 \
    --bridge $BRIDGE
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 admin add-relayer \
    --relayer $RELAYER_ADDR2 \
    --bridge $BRIDGE

cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 admin add-relayer \
    --relayer $RELAYER_ADDR3 \
    --bridge $BRIDGE
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 admin add-relayer \
    --relayer $RELAYER_ADDR3 \
    --bridge $BRIDGE
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 admin add-relayer \
    --relayer $RELAYER_ADDR3\
    --bridge $BRIDGE


cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 admin set-threshold \
    --threshold 2 \
    --bridge $BRIDGE
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 admin set-threshold \
    --threshold 2 \
    --bridge $BRIDGE
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 admin set-threshold \
    --threshold 2 \
    --bridge $BRIDGE
