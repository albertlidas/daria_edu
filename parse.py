import requests
from bs4 import BeautifulSoup

response = requests.get('https://ultra-shop.com/men/odezhda/p/56578;0005_4ec180?product')
soup = BeautifulSoup(response.text, 'html.parser')


def main():
    """main function"""
    ul_list = soup.find_all('ul', {'class': 'text'})
    needed_ul = ul_list[0]
    data = {}
    for li in needed_ul.find_all('li'):
        li = li.text.strip().split(':')
        data[li[0]] = li[1]
        print(data)
        break


if __name__ == '__main__':
    main()
