FROM python:2.7-alpine

RUN apk update
RUN apk add --virtual=build_tools musl-dev gcc python-dev make cmake g++ gfortran
#RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories
RUN apk update
WORKDIR /var/www
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN pip install numpy
RUN apk add postgresql postgresql-dev
RUN pip install psycopg2
RUN pip install pandas
RUN apk del build_tools
CMD python -c "import pandas; df = pandas.Dataframe()"
