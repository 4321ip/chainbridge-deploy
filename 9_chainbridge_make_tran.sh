
set -a; source ../chainbridge.env; set +a

# Approve the handler to spend tokens on our behalf (to transfer them to the token safe).
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc20 approve \
    --amount 100 \
    --erc20Address $TOKEN_ERC20 \
    --recipient $HANDLER_ERC20
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 erc20 approve \
    --amount 100 \
    --erc20Address $TOKEN_ERC20 \
    --recipient $HANDLER_ERC20
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 erc20 approve \
    --amount 100 \
    --erc20Address $TOKEN_ERC20 \
    --recipient $HANDLER_ERC20


#Execute a deposit.
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 erc20 deposit \
    --amount 100 \
    --dest 2\
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
    --owner $ADDR \
    --spender $HANDLER_ERC20 \
    --erc20Address $TOKEN_ERC20



f195f0deec3586febeb7fe54ea5bf0648c3301171a3b519c61312097fc86ab36


cb-sol-cli --url $GATEWAY_RINKEBY --privateKey f195f0deec3586febeb7fe54ea5bf0648c3301171a3b519c61312097fc86ab36 --gasPrice 10000000000 erc20 approve \
    --amount 200 \
    --erc20Address $TOKEN_ERC20 \
    --recipient $HANDLER_ERC20

    cb-sol-cli --url $GATEWAY_RINKEBY --privateKey f195f0deec3586febeb7fe54ea5bf0648c3301171a3b519c61312097fc86ab36 --gasPrice 10000000000 erc20 deposit \
        --amount 200 \
        --dest 2\
        --bridge $BRIDGE \
        --recipient $ADDR \
        --resourceId $RESOURCE_ID_ERC20

cb-sol-cli --url $GATEWAY_RINKEBY --privateKey f195f0deec3586febeb7fe54ea5bf0648c3301171a3b519c61312097fc86ab36 --gasPrice 10000000000 erc20 allowance \
    --owner $ADDR \
    --spender $HANDLER_ERC20 \
    --erc20Address $TOKEN_ERC20
