<!--ts-->
   * [Scrapy](#scrapy)
      * [Install scrapy](#install-scrapy)
      * [Setting up a new scraper](#setting-up-a-new-scraper)
      * [Writing a simple spider (scraper)](#writing-a-simple-spider-scraper)
      * [How to run our spider](#how-to-run-our-spider)

<!-- Added by: gil_diy, at: Fri 01 Oct 2021 23:25:37 IDT -->

<!--te-->

# Scrapy

## Install scrapy

```python
pip install scrapy
```



## Setting up a new scraper

after installing scrapy in th python project:

```bash
scrapy startproject my_tutorial
```

## Writing a simple spider (scraper)

Spiders are classes that you define and that Scrapy uses to scrape information from a website. They must subclass Spider and define the initial requests to make, optionally how to follow links in the pages, and how to parse the downloaded page content to extract data.

```bash
/home/gil_diy/PycharmProjects/scrapy_playground/tutorial/tutorial/spiders/quotes_spider.py
```

Here is a simple code example:

```python
import scrapy


class QuotesSpider(scrapy.Spider):
    name = "quotes"

    def start_requests(self):
        urls = [
            'http://quotes.toscrape.com/page/1/',
            'http://quotes.toscrape.com/page/2/',
        ]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        page = response.url.split("/")[-2]
        filename = f'quotes-{page}.html'
        with open(filename, 'wb') as f:
            f.write(response.body)
        self.log(f'Saved file {filename}')
```


## How to run our spider

run the following command from the `my_tutorial` directory (make sure pipenv environmen is active):

```bash
scrapy crawl quotes
```