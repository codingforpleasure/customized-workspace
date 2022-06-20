# get_tweets_with_bearer_token

import requests
import urllib
import bs4
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import pandas as pd
import time

SCROLL_PAUSE_TIME = 0.7


# Change the n number to cover the entire lenght of the page
# Try different values of sleep_time_s, depending on how fast the sections are loading
# def scroll(browser, n=20, sleep_time_s=3):
#     for i in range(n):
#         browser.find_element(by=By.TAG_NAME, value='body').send_keys(Keys.PAGE_DOWN)
#         time.sleep(sleep_time_s)
#         print(f"pressed {i} times down.")

# Scroll function
# This function takes two arguments. The driver that is being used and a timeout.
# The driver is used to scroll and the timeout is used to wait for the page to load.

def scroll_on_main_page(driver, timeout):
    scroll_pause_time = timeout

    # Get scroll height
    last_height = driver.execute_script("return document.body.scrollHeight")
    print(f"last_height: {last_height}")

    while True:
        # Scroll down to bottom
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")

        # Wait to load page
        time.sleep(scroll_pause_time)

        # Calculate new scroll height and compare with last scroll height
        new_height = driver.execute_script("return document.body.scrollHeight")
        print(f"new_height: {new_height}")

        if new_height == last_height:
            # If heights are the same it will exit the function
            break

        last_height = new_height


def scroll(driver, timeout):
    scroll_pause_time = timeout

    # Get scroll height
    last_height = driver.execute_script("return document.body.scrollHeight")
    print(f"last_height: {last_height}")

    while True:
        # Scroll down to bottom
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")

        # Wait to load page
        time.sleep(scroll_pause_time)

        # Calculate new scroll height and compare with last scroll height
        new_height = driver.execute_script("return document.body.scrollHeight")
        print(f"new_height: {new_height}")

        if new_height == last_height:
            # If heights are the same it will exit the function
            break

        last_height = new_height


if __name__ == '__main__':
    # url = "https://news.yahoo.com/scientists-set-1-000-traps-193818509.html"
    # url = "https://news.yahoo.com/science/"
    # content = urllib.request.urlopen(url).read()
    # soup = BeautifulSoup(content, 'html.parser')
    driver = webdriver.Firefox()
    text_list = []
    category_list = []

    dict_categories = {'science': 'https://news.yahoo.com/science/',
                       'Finance': 'https://finance.yahoo.com/',
                       'entertainment': 'https://www.yahoo.com/entertainment/'}

    for category in dict_categories.keys():
        # if category == 'Finance':
        #     url = 'https://finance.yahoo.com/'
        # elif category == 'entertainment':
        #     url = 'https://www.yahoo.com/entertainment/'
        # else:
        # # url = "https://finance.yahoo.com/"
        # url = f"https://news.yahoo.com/{category}/"
        url = dict_categories[category]

        driver.get(url)
        scroll(driver, timeout=4)

        res = driver.find_elements(By.TAG_NAME, 'h3')
        count = len(res)

        for title in res:
            print(title.text)
            text_list.append(title.text)
            print("*" * 30)

        category_list += [category] * count

        break

    df = pd.DataFrame({"text": text_list, "category": category_list})
    print("Debug")

    df.to_csv("yahoo_data.csv")
