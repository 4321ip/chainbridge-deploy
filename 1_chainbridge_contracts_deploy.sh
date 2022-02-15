#!!! ВАЖНО !!!! в этот момент во всех сетях должен быть одинаковый nonce
cd ./cb-sol-cli/
set -a; source ../chainbridge.env; set +a

# deploy the bridge contract and ERC20 handler contract on the source (Rinkeby)¶
#nonce = 270
cb-sol-cli --url $GATEWAY_RINKEBY --privateKey $PK --gasPrice 10000000000 deploy \
    --bridge --erc20 --erc20Handler --erc721 --erc721Handler \
    --relayers $RELAYER_ADDR1,$RELAYER_ADDR2,$RELAYER_ADDR3 \
    --relayerThreshold 2 \
    --chainId 0
#3. deploy the bridge contract and ERC20 handler contract on the Destination (binance)¶
cb-sol-cli --url $GATEWAY_BINANCE --privateKey $PK --gasPrice 10000000000 deploy\
    --bridge --erc20 --erc20Handler --erc721 --erc721Handler \
    --relayers $RELAYER_ADDR1,$RELAYER_ADDR2,$RELAYER_ADDR3 \
    --relayerThreshold 2 \
    --chainId 1
#3. deploy the bridge contract and ERC20 handler contract on the Destination (binance)¶
cb-sol-cli --url $GATEWAY_POLYGON --privateKey $PK --gasPrice 10000000000 deploy\
    --bridge --erc20 --erc20Handler --erc721 --erc721Handler \
    --relayers $RELAYER_ADDR1,$RELAYER_ADDR2,$RELAYER_ADDR3  \
    --relayerThreshold 2 \
    --chainId 2

#!!!!установить!!!! переменные в ./chainbridge.env
#BRIDGE="<resulting bridge contract address>"
#HANDLER_ERC20="<resulting erc20 handler contract address>"
#HANDLER_ERC721="<resulting erc20 handler contract address>"
#WRAPPED_TOKEN_ERC20="<resulting wrapped erc20 token address>"
#WRAPPED_TOKEN_ERC721="<resulting wrapped erc20 token address>"
set -a; source ../chainbridge.env; set +a
