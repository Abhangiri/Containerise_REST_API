# Makefile for the student-crud-api project

# Image and container names
IMAGE_NAME = student-crud-api
IMAGE_TAG = v1
CONTAINER_NAME = student-crud-container

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

# Run the Docker container
run:
	docker run -p 5000:5000 --name $(CONTAINER_NAME) $(IMAGE_NAME):$(IMAGE_TAG)

# Stop the running container
stop:
	docker stop $(CONTAINER_NAME)

# Remove the container
rm-container:
	docker rm $(CONTAINER_NAME)

# Clean up the image (if needed)
rm-image:
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG)

# Rebuild and run the container (full reset)
rebuild: rm-container rm-image build run

# View logs of the container
logs:
	docker logs -f $(CONTAINER_NAME)

# Exec into the container (run a bash shell inside the container)
exec:
	docker exec -it $(CONTAINER_NAME) /bin/bash
