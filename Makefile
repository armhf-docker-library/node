IMAGE = node
IMAGE_ALIASES = google/nodejs
REPOSITORY_IMAGE = armhfbuild/node

build:
	docker build -t ${IMAGE} .

tags: build
	docker tag -f ${IMAGE} ${REPOSITORY_IMAGE}
	for image in $(IMAGE_ALIASES); do \
		docker tag -f ${IMAGE} $$image; \
	done

push: tags
	docker push ${REPOSITORY_IMAGE}

.PHONY: build tags push
