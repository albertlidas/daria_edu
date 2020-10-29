import requests
from bs4 import BeautifulSoup


class BasicProductPageParser:

    def __init__(self):
        self.url = 'https://ultra-shop.com/men/odezhda/p/56578;0005_4ec180?product'
        self.html = self._get_html()
        self.soup = BeautifulSoup(self.html, 'html.parser')

    def _get_html(self):
        result = requests.get(self.url)
        result.raise_for_status()
        return result.text

