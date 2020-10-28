import requests
from bs4 import BeautifulSoup

URL = 'https://ultra-shop.com/men/odezhda'
HEADER = {'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
          'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:82.0) Gecko/20100101 Firefox/82.0'}


def get_links():
    productlinks = [URL]
    for page in range(2, 41):
        pages_link = URL + '?page={}'.format(page)
        productlinks.append(pages_link)
    return productlinks


def get_p():
    link_list = get_links()
    products = []
    for link in link_list:
        r = requests.get(link, headers=HEADER)
        soup = BeautifulSoup(r.text, 'html.parser')
        needed_p = soup.find_all('div', class_="baseline-helper")
        for p in needed_p:
            products.append(
                {
                    'brand': p.find('p', class_="designer-info fs10 up ls2 bold").get_text(strip=True),
                    'product_description': p.find('p', class_="item-info fs10 up ls2").get_text(strip=True),
                    'price': p.find('span', itemprop="price").get_text(strip=True),
                    'currency': p.find('p', class_="item-price fs10 filter-item up ls2").get_text(strip=True)[4:]
                }
            )
    return products

res=get_p()
print(res)