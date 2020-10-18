import requests
from bs4 import BeautifulSoup

response = requests.get('https://ultra-shop.com/men/odezhda/p/56578;0005_4ec180?product')
soup = BeautifulSoup(response.text, 'html.parser')


def main():
    ul_list = soup.find_all('ul', {'class': 'text'})
    needed_ul = ul_list[0]
    data = {}
    for li in needed_ul.find_all('li'):
        li = li.text.strip().split(':')
        key = li[0]
        value = li[1].strip()
        data={key : value}
        print(data)

if __name__ == '__main__':
    main()
