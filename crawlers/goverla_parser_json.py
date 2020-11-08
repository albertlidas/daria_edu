import json
import requests
from bs4 import BeautifulSoup


def get_soup_by_url(url):
    r = requests.get(url)
    soup = BeautifulSoup(r.text, 'html.parser')
    return soup


class CurrencyParser:
    BASE_URL = 'https://goverla.ua/'

    def get_data(self):
        soup = get_soup_by_url(self.BASE_URL)
        needed_divs = soup.find_all('div', class_='gvrl-table-body')
        data = {}
        for numbers in needed_divs.find_all('div', class_='gvrl-table-row'):
            currency_name = numbers.find('div', class_='gvrl-table-cell').find('img').get('alt')
            bid = numbers.find('div', class_='gvrl-table-cell bid').text.strip()
            ask = numbers.find('div', class_='gvrl-table-cell ask').text.strip()

            data[currency_name] = {
                'Ask': ask,
                'Bid': bid
            }

        return data

    def json_dump(self):
        with open('data.json', 'w') as fp:
            json.dump(self.get_data(), fp)

