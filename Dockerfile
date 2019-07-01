FROM python:2.7.16


RUN apt-get update -y && apt-get install -y libpq-dev
RUN pip install trac psycopg2

EXPOSE 8000

#RUN trac-admin /root/trac initenv tracprojectname sqlite:db/trac.db

# for this example, you need to specify --network some-network 
# when building and running this image
# TODO postgres connection string should come from an environment variable
RUN trac-admin /root/trac initenv tracprojectname  postgres://postgres:mysecretpassword@some-postgres/postgres?schema=destination
CMD tracd --port 8000 /root/trac
