-include .env

fuzz:
	@echo "Fuzzing...  "
	fuzz -c .fuzz_foundry_${Contract}.yml arm
	forge build --build-info
	anvil &> /dev/null &
	sleep 2 # Wait for 2 seconds
	forge script script/${Contract}.s.sol --fork-url http://localhost:8545 --broadcast
	 fuzz -c .fuzz_foundry_${Contract}.yml run
	fuzz -c .fuzz_foundry_${Contract}.yml disarm

clean:
	rm -rf ./out/
	rm -rf ./.scribble-arming.meta.json/

    