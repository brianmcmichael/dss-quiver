all    :; dapp --use solc:0.8.9 build
clean  :; dapp clean
test   :; dapp --use solc:0.8.9 test
deploy :; make && dapp create DssQuiver
