
set -a; source ../chainbridge.env; set +a

# Approve the handler to spend tokens on our behalf (to transfer them to the token safe).
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc20 approve \
    --amount 10000 \
    --erc20Address $TOKEN_ERC20 \
    --recipient $HANDLER_ERC20
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 erc20 approve \
    --amount 10000 \
    --erc20Address $TOKEN_ERC20 \
    --recipient $HANDLER_ERC20
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 erc20 approve \
    --amount 10000 \
    --erc20Address $TOKEN_ERC20 \
    --recipient $HANDLER_ERC20


#Execute a deposit.
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc20 deposit \
    --amount 100 \
    --dest 2\
    --bridge $BRIDGE \
    --recipient $ADDR \
    --resourceId $RESOURCE_ID_ERC20_RINKEBY_POLYGON

cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 erc20 deposit \
    --amount 100 \
    --dest 0\
    --bridge $BRIDGE \
    --recipient $ADDR \
    --resourceId $RESOURCE_ID_ERC20_POLYGON_RINKEBY


cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc20 allowance \
    --owner $ADDR \
    --spender $HANDLER_ERC20 \
    --erc20Address $TOKEN_ERC20

