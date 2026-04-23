FROM python:3.11-slim

# 1. Create a non-root user with UID 1001
# We use --system to create a service account and -m to give it a home directory
RUN groupadd -g 1001 appgroup && \
    useradd -r -u 1001 -g appgroup appuser

# 2. Set the working directory and give ownership to user 1001
WORKDIR /app
RUN chown 1001:1001 /app

# 3. Switch to the non-root user
USER 1001

# Now, any command that follows runs as UID 1001
CMD ["/bin/bash", "-c", "echo 'Running as user:' $(whoami) && python3 -c \"print('Hello from Python')\""]
