export FUZZ_API_KEY= # Add your fuzz api key here

fuzz:
	@echo "Fuzzing... "
	fuzz -c .fuzz_foundry.yml arm
	forge build --build-info
	anvil &> /dev/null &
	sleep 2 # Wait for 2 seconds
	forge script script/Counter.s.sol --fork-url http://localhost:8545 --broadcast
	 fuzz -c .fuzz_foundry.yml run
	

clean:
	rm -rf ./out/
	rm -rf ./.scribble-arming.meta.json/

    