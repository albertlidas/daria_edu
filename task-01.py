import requests
from bs4 import BeautifulSoup

class Product:

    def __init__(self):
        self.url = 'https://ultra-shop.com/men/odezhda/p/56578;0005_4ec180?product'
        self.html = self.get_html()

    def get_html(self):
        result = requests.get(self.url)
        result.raise_for_status()
        return result.text

    def get_ul(self):
        soup = BeautifulSoup(self.html, 'html.parser')
        ul_list = soup.find_all('ul', class_='text')
        needed_ul = ul_list[0]
        return ul_list

    def get_li(self):
        needed_ul = get_ul(soup)
        data = {}
        for li in needed_ul.find_all('li'):
            li = li.text.strip().split(':')
            key = li[0]
            value = li[1].strip()
            data = {key: value}
            print(data)

p=Product(get_li)
print(p)
