BOARDS += h8l

local-h8l: version
	docker buildx bake --load --file=docker/hailo8l/h8l.hcl --set h8l.tags=frigate:latest-h8l h8l

build-h8l: version
	docker buildx bake --file=docker/hailo8l/h8l.hcl --set h8l.tags=$(IMAGE_REPO):${GITHUB_REF_NAME}-$(COMMIT_HASH)-h8l h8l

push-h8l: build-h8l
	docker buildx bake --push --file=docker/hailo8l/h8l.hcl --set h8l.tags=$(IMAGE_REPO):${GITHUB_REF_NAME}-$(COMMIT_HASH)-h8l h8l