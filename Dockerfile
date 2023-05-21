FROM python:3.7-slim

RUN apt-get update
RUN pip install --upgrade pip
RUN pip install pymongo scrapy scrapyd beautifulsoup4 logparser scrapydweb
RUN mkdir /app
WORKDIR /app

RUN mkdir logs
COPY . .
RUN pip install -r requirements.txt
RUN chmod +x entrypoint.sh

EXPOSE 6800 5000
ENTRYPOINT ["./entrypoint.sh"]