FROM python:2.7-alpine

RUN apk --no-cache add --virtual=build_tools musl-dev gcc python-dev make cmake g++ gfortran
RUN apk update
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h
RUN pip install numpy
RUN pip install pandas==0.18.1
RUN apk del build_tools
RUN apk add libstdc++
RUN python -c "import pandas; df = pandas.DataFrame()"
CMD python -c "import time; time.sleep(999999)"
