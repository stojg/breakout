# https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md

dev: start

build:
	docker build . -t stojg/breakout

logs:
	 docker logs -f goofy_euler

start: build
		docker run --rm \
    		--volume "$(shell pwd)/scripts:/scripts:ro" \
    		--publish 8043:8080 \
    		--env "NODE_ENV=production" \
    		--user "node" \
    		--memory "32M" \
    		--memory-swap "32M" \
    		--interactive \
    		--tty \
    		stojg/breakout

push: build
	docker build . -t stojg/breakout:latest -t stojg/breakout:$(shell git rev-parse --verify HEAD)
	docker push stojg/breakout
