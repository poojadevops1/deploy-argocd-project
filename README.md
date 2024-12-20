# GitHub Actions CI/CD Pipeline for Docker Image

This repository is configured to automate the process of building, pushing Docker images, and sending notifications using GitHub Actions.

## Workflow Overview
The GitHub Actions workflow automates the following steps:

1. **Build the Docker image**: The Docker image is built from the repository's Dockerfile.
2. **Push the Docker image to Docker Hub**: After building the image, it is pushed to Docker Hub with a unique tag based on the GitHub Actions run ID.
3. **Send a notification email**: Once the image is successfully built and pushed, an email notification is sent to the configured email address.

## Workflow Trigger
The workflow is triggered on a `push` event to the `main` branch, except for changes made to the `README.md` file. This means that pushing any code changes to the `main` branch will trigger the workflow.

```yaml
name: Build, Push Docker Image, and Send Notification

on:
  push:
    branches:
      - main
    paths-ignore:
      - 'README.md'
```

### Jobs in the Workflow

## 1. Build Job (build):
Checkout repository: The repository code is checked out to make it available for the workflow.
Set up Docker Buildx: Docker Buildx is set up for building the Docker image.
Log in to Docker Hub: The workflow logs into Docker Hub using secrets stored in GitHub.
Build and Push Docker image: The Docker image is built using the Dockerfile and pushed to Docker Hub with a unique tag.

## 2. Notify Job (notify):
Send notification email: Once the Docker image is successfully built and pushed, an email notification is sent using the configured SMTP server.

# Secrets Configuration
For the workflow to function correctly, you need to configure the following GitHub secrets in your repository:

1. **DOCKERHUB_USERNAME**: Your Docker Hub username.
2. **DOCKERHUB_TOKEN**: Your Docker Hub access token (used instead of a password).
3. **EMAIL**: The email address that will send the notification.
4. **SMTP_PASSWORD**: Your SMTP password (for the email account).
5. **NOTIFY_EMAIL**: The email address to receive the notification email.

# Example Email Notification
The email that is sent on successful completion will look like this:
CI/CD Pipeline Summary for <repository_name>:

Build and Push Status: Success

Docker Image Tag: <dockerhub_username>/my-docker-image:<run_id>

For more details, check the GitHub Actions log: <link_to_run_log>

# Requirements
1. **GitHub Actions**: For running the CI/CD pipeline.
2. **Docker Hub account**: For storing the Docker image.
3. **Email account with SMTP access**: For sending the notification email.


