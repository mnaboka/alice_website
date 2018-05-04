IMAGE_NAME=alice_website
CONTAINER_NAME=$(IMAGE_NAME)-test

all: docker stop start

docker:
	@echo "+$@"
	docker build -t $(IMAGE_NAME) .

start:
	@echo "+$@"
	docker run \
			-d \
			--rm \
			-p8000:8000 \
			--name $(CONTAINER_NAME) \
			$(IMAGE_NAME)
	@echo "\n\nWebsite available on http://127.0.0.1:8000"

stop:
	@echo "+$@"
	docker kill $(CONTAINER_NAME) > /dev/null 2>&1 || true
