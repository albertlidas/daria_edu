import requests
import pprint
from bs4 import BeautifulSoup


class UltraShopParser:

    BASE_URL = 'https://ultra-shop.com'

    def get_data_with_categories(self):
        soup = self._get_soup_by_url(self.BASE_URL)
        data_with_categories = {}
        for cat_tag in soup.find('ul', class_='header-menu').find_all('li', class_="header-menu-item")[:2]:
            cat_url = self.BASE_URL + cat_tag.find('a').get('href')
            cat_name = cat_tag.find('a').text
            data_with_categories[cat_name] = cat_url
        return data_with_categories

    def get_data_with_subcategories(self):
        category_data = self.get_data_with_categories()
        data = {i: {} for i in category_data.keys()}
        for cat_name, cat_url in category_data.items():
            soup = self._get_soup_by_url(cat_url)
            for subcat_tag in soup.find('div', {'id': '1_filter_items'}).find_all('a'):
                subcat_url = self.BASE_URL + subcat_tag.get('href')
                subcat_name = subcat_tag.text.strip()
                data[cat_name][subcat_name] = subcat_url
        return data

    def get_data_with_product_urls(self):
        data = self.get_data_with_subcategories()
        for cat, cat_data in data.items():
            for subcat, subcat_url in cat_data.items():
                data[cat][subcat] = {product_url: {} for product_url in self._get_subcat_product_urls(subcat_url)}
                break  # For test purposes. Comment this line if don't need
            break  # For test purposes. Comment this line if don't need
        return data

    def get_data_with_products(self):
        data = self.get_data_with_product_urls()
        for cat, cat_data in data.items():
            for subcat, product_urls in cat_data.items():
                for product_url in product_urls:
                    soup = self._get_soup_by_url(product_url)
                    brand = soup.find('span', {'itemprop': 'brand'})
                    description = soup.find('span', {'class': 'prod-desc'})
                    price_old = soup.find('span', {'class': 'product-price-old'})
                    price = soup.find('span', {'itemprop': 'price'})
                    currency = soup.find('span', {'itemprop': 'priceCurrency'})
                    pprint.pprint(
                        data[cat][subcat][product_url], indent=4
                    )
                    data[cat][subcat][product_url] = {
                        'brand': brand.text.strip() if brand else '',
                        'description': description.text.strip() if description else '',
                        'price_old': price_old.text.strip() if price_old else '',
                        'price': price.text.strip() if price else '',
                        'currency': currency.text.strip() if currency else '',
                    }
                    break
                break  # For test purposes. Comment this line if don't need
            break  # For test purposes. Comment this line if don't need
        return data

    def _get_soup_by_url(self, url):
        r = requests.get(url)
        soup = BeautifulSoup(r.text, 'html.parser')
        return soup

    def _get_subcat_product_urls(self, subcat_url):
        product_urls = set()
        in_progress = True
        processed_pages = []
        while in_progress:
            page_count = processed_pages[-1] + 1 if processed_pages else 1
            next_url = subcat_url + '?page={}'.format(page_count)
            soup = self._get_soup_by_url(next_url)
            # Get all product URLs from the page
            for product_tag in soup.find('ul', {'id': 'catalog-items'}).find_all('a'):
                product_urls.add('{}{}'.format(self.BASE_URL, product_tag.get('href')))

            # Check if the next page exists
            page_selected = soup.find('li', {'class': 'page selected'})

            # Check if there only one single page
            if not page_selected:
                in_progress = False

            # Do extra check
            if page_selected:
                if int(page_selected.text.strip()) in processed_pages:
                    in_progress = False

            # Add parsed page number to the list of processed pages
            processed_pages.append(page_count)
            print(in_progress, ' ', next_url, ' selected ', page_selected)
        return product_urls

#
# if __name__ == '__main__':
#     i = UltraShopParser().get_data_with_products()
#     pprint.pprint(i, indent=4)

res= UltraShopParser().get_data_with_subcategories()
print(res)