
set -a; source ../chainbridge.env; set +a

# Approve the handler to spend tokens on our behalf (to transfer them to the token safe).
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc20 approve \
    --amount 100 \
    --erc20Address $TOKEN \
    --recipient $HANDLER
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 erc20 approve \
    --amount 1000 \
    --erc20Address $TOKEN \
    --recipient $HANDLER
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 erc20 approve \
    --amount 1000 \
    --erc20Address $TOKEN \
    --recipient $HANDLER


#Execute a deposit.
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc20 deposit \
    --amount 100 \
    --dest 1 \
    --bridge $BRIDGE \
    --recipient $ADDR \
    --resourceId $RESOURCE_ID_ERC20

cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 erc20 deposit \
    --amount 100 \
    --dest 2 \
    --bridge $BRIDGE \
    --recipient $ADDR \
    --resourceId $RESOURCE_ID_ERC20


cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc20 allowance \
    --spender $ADDR \
    --owner $HANDLER \
    --erc20Address $TOKEN

cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc20 balance \
    --address $ADDR \
    --erc20Address $TOKEN
