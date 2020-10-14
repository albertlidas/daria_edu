import requests
from bs4 import BeautifulSoup

response = requests.get('https://ultra-shop.com/men/odezhda/p/56578;0005_4ec180?product')
soup = BeautifulSoup(response.text, 'html.parser')


def get_ul_tag(html_soup):
    ul_list = html_soup.find_all('ul', {'class': 'text'})
    needed_ul = ul_list[0]
    return needed_ul


def main():
    """main function"""
    needed_ul = get_ul_tag(soup)
    data = {}
    for li in needed_ul.find_all('li'):
        li = li.text.strip().split(':')
        data[li[0]] = li[1]
        print(data)
        break


if __name__ == '__main__':
    main()
