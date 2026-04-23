FROM python:3.11-slim
CMD ["/bin/bash", "-c", "echo 'Hello from Bash' && python3 -c \"print('Hello from Python')\""]
