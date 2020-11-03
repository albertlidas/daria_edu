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
        needed_headers = soup.find_all('div', class_='gvrl-table-header')
        needed_block = needed_divs[0]
        headers = needed_headers[0]
        data = {}
        for numbers in needed_block.find_all('div', class_='gvrl-table-row'):
            currency_name = numbers.find('div', class_='gvrl-table-cell').find('img').get('alt')
            bid = numbers.find('div', class_='gvrl-table-cell bid').text.strip()
            ask = numbers.find('div', class_='gvrl-table-cell ask').text.strip()
            for header in headers.find_all('div', class_='gvrl-table-row'):
                cur_header = header.find_all('div', class_='gvrl-table-cell')[0].text.strip()
                bid_header = header.find_all('div', class_='gvrl-table-cell')[1].text.strip()
                ask_header = header.find_all('div', class_='gvrl-table-cell')[2].text.strip()

                data[cur_header] = currency_name
                data[bid_header] = bid
                data[ask_header] = ask

            return data

    def json_dump(self):
        json_data = json.dumps(self.get_data())
        with open("data.json", "w") as file:
            file.write(json_data)


res = CurrencyParser().json_dump()
print(res)
