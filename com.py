import requests
from bs4 import BeautifulSoup


class BasicProductPage:
    URL = 'https://ultra-shop.com/men/odezhda'

    def __init__(self):
        self.url = self.URL
        self.html = self.get_html()
        self.soup = BeautifulSoup(self.html, 'html.parser')

    def get_html(self):
        result = requests.get(self.url)
        result.raise_for_status()
        return result.text
