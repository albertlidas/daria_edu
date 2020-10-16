import requests
from bs4 import BeautifulSoup

response = requests.get('https://ultra-shop.com/men/odezhda/p/56578;0005_4ec180?product')
soup = BeautifulSoup(response.text, 'html.parser')


def get_ul_tag(html_soup):
    ul_list = html_soup.find_all('ul', {'class': 'text'})
    needed_ul = ul_list[0]
    return needed_ul

def main():
    needed_ul = get_ul_tag(soup)
    data = {}
    for li in needed_ul.find_all('li'):
        li = li.text.strip().split(':')
        key = li[0]
        value = li[1].strip()
        data = {key:value}
        print(data)


if __name__ == '__main__':
    main()