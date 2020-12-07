FROM drmechanic/blackpearl:1.0

RUN pip3 install --upgrade pip setuptools 
RUN pip3 install --upgrade pip
RUN if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi 
RUN if [ ! -e /usr/bin/python ]; then ln -sf /usr/bin/python3 /usr/bin/python; fi 
RUN rm -r /root/.cache

RUN git clone https://github.com/IntelligentSammy/BlackPearl /root/pearl

RUN mkdir /root/pearl/bin/
WORKDIR /root/pearl/
RUN chmod +x /usr/local/bin/*
RUN pip3 install -r requirements.txt
CMD ["bash","start.sh"]
