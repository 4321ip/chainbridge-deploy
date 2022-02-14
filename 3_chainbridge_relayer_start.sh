set -a; source ../chainbridge.env; set +a

rm ../config1.json
rm ../config2.json
rm ../config3.json
echo "{
  \"chains\": [
    {
      \"name\": \"rinkeby\",
      \"type\": \"ethereum\",
      \"id\": \"0\",
      \"endpoint\": \"$EP_RINKEBY\",
      \"from\": \"$RELAYER_ADDR1\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER\",
        \"genericHandler\": \"$HANDLER\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    },
    {
      \"name\": \"binance\",
      \"type\": \"ethereum\",
      \"id\": \"1\",
      \"endpoint\": \"$EP_BINANCE\",
      \"from\": \"$RELAYER_ADDR1\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER\",
        \"genericHandler\": \"$HANDLER\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    },
    {
      \"name\": \"polygon\",
      \"type\": \"ethereum\",
      \"id\": \"2\",
      \"endpoint\": \"$EP_POLYGON\",
      \"from\": \"$RELAYER_ADDR1\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER\",
        \"genericHandler\": \"$HANDLER\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    }
  ]
}" >> ../config1.json
echo "{
  \"chains\": [
    {
      \"name\": \"rinkeby\",
      \"type\": \"ethereum\",
      \"id\": \"0\",
      \"endpoint\": \"$EP_RINKEBY\",
      \"from\": \"$RELAYER_ADDR2\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER\",
        \"genericHandler\": \"$HANDLER\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    },
    {
      \"name\": \"binance\",
      \"type\": \"ethereum\",
      \"id\": \"1\",
      \"endpoint\": \"$EP_BINANCE\",
      \"from\": \"$RELAYER_ADDR2\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER\",
        \"genericHandler\": \"$HANDLER\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    },
    {
      \"name\": \"polygon\",
      \"type\": \"ethereum\",
      \"id\": \"2\",
      \"endpoint\": \"$EP_POLYGON\",
      \"from\": \"$RELAYER_ADDR2\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER\",
        \"genericHandler\": \"$HANDLER\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    }
  ]
}" >> ../config2.json
echo "{
  \"chains\": [
    {
      \"name\": \"rinkeby\",
      \"type\": \"ethereum\",
      \"id\": \"0\",
      \"endpoint\": \"$EP_RINKEBY\",
      \"from\": \"$RELAYER_ADDR3\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER\",
        \"genericHandler\": \"$HANDLER\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    },
    {
      \"name\": \"binance\",
      \"type\": \"ethereum\",
      \"id\": \"1\",
      \"endpoint\": \"$EP_BINANCE\",
      \"from\": \"$RELAYER_ADDR3\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER\",
        \"genericHandler\": \"$HANDLER\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    },
    {
      \"name\": \"polygon\",
      \"type\": \"ethereum\",
      \"id\": \"2\",
      \"endpoint\": \"$EP_POLYGON\",
      \"from\": \"$RELAYER_ADDR3\",
      \"opts\": {
        \"bridge\": \"$BRIDGE\",
        \"erc20Handler\": \"$HANDLER\",
        \"genericHandler\": \"$HANDLER\",
        \"gasLimit\": \"1000000\",
        \"maxGasPrice\": \"10000000000\"
      }
    }
  ]
}" >> ../config3.json




#goto virtual machine for relayer
sshfs root@95.216.69.163:/home/node/chainbridge/chainbridge ~/dev/blockchain/vm_relay_folder
cp ../config1.json ~/dev/blockchain/vm_relay_folder
cp ../config2.json ~/dev/blockchain/vm_relay_folder
cp ../config3.json ~/dev/blockchain/vm_relay_folder

ssh root@95.216.69.163 && \
cd /home/node/chainbridge/chainbridge

#git clone -b v1.1.1 --depth 1 https://github.com/ChainSafe/chainbridge \
#&& cd chainbridge \
#&& make build

#export RELAYER_PK="<private key for wallet>"  #RELAYER_PK1 RELAYER_PK2 RELAYER_PK3
#./build/chainbridge accounts import --privateKey $RELAYER_PK1
#./build/chainbridge accounts import --privateKey $RELAYER_PK2
#./build/chainbridge accounts import --privateKey $RELAYER_PK3

./build/chainbridge --config config1.json --verbosity trace --latest
