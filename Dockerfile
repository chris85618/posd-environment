FROM ubuntu:18.04 AS gtest
ARG GTEST_VERSION=1.8.0
# Install dependencies
RUN apt-get update && apt-get install -y g++ make libgtest-dev cmake \
  && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y unzip \
  && rm -rf /var/lib/apt/lists/*
# Download & build GTest framework
ADD https://github.com/google/googletest/archive/release-${GTEST_VERSION}.zip /googletest-release-${GTEST_VERSION}.zip
RUN unzip /googletest-release-${GTEST_VERSION}.zip
WORKDIR /googletest-release-${GTEST_VERSION}
RUN mkdir /result
RUN cmake CMakeLists.txt && make && make DESTDIR=/result install

FROM ubuntu:18.04
RUN apt-get update && apt-get install -y g++ make libgtest-dev cmake \
  && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y sqlite3 libsqlite3-dev \
  && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y gdb valgrind \
  && rm -rf /var/lib/apt/lists/*
COPY --from=gtest /result /
VOLUME /code
WORKDIR /code
ENTRYPOINT make
CMD [""]
