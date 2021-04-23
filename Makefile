all:
	docker buildx build \
		--progress=plain \
		-t matthewbaggett/octoprint-mjpg-streamer-yu12 \
		--target=result \
		--push \
		.
