# We base our image on the super lean and clean Alpine distro with Node 6.
FROM python:2.7-alpine

RUN mkdir -p /app/healthcheck
WORKDIR /app/healthcheck

ADD . .

# Always EXPOSE the ports you will use, otherwise platforms like OpenShift
# will not be able to propose the correct ports to connect to.
EXPOSE 3000

# Most Dockerfiles really should only run a single process...
CMD ["python", "main.py"]
