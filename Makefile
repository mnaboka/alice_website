IMAGE_NAME=alice_website
CONTAINER_NAME=$(IMAGE_NAME)-test

all: stop start

docker:
	@echo "+$@"
	docker build -t "$(IMAGE_NAME):$(BUILD_NUMBER)" .

start:
	@echo "+$@"
	docker run \
			-d \
			--rm \
			-p8000:8000 \
			--name $(CONTAINER_NAME) \
			$(IMAGE_NAME):latest
	@echo "\n\nWebsite available on http://127.0.0.1:8000"

stop:
	@echo "+$@"
	docker kill $(CONTAINER_NAME) > /dev/null 2>&1 || true

ci:
	@echo "+$@"
	docker build -t ci:latest jenkins

ci-start: ci
	@echo "+$@"
	docker run \
			-d \
			--rm \
			-p8080:8080 \
			-v $(PWD)/jenkins_home:/var/jenkins_home \
			-v /var/run/docker.sock:/var/run/docker.sock \
			--privileged \
			--name jenkins-ci \
			ci:latest

ci-stop:
	@echo "+$@"
	docker kill jenkins-ci > /dev/null 2>&1 || true
