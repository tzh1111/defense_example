FROM test
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        pkg-config \
        python3 \
        python3-dev \
        unzip \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py
COPY ./pip.conf /root/.pip/pip.conf
RUN pip install --no-cache-dir numpy pillow
COPY . /competition
WORKDIR /competition
