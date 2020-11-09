import requests
from bs4 import BeautifulSoup


class EvaParser:
    URL = 'https://eva.ua/217-324/parfjumerija-zhenskaja/'

    def get_soup_by_url(self, url):
        r = requests.get(url)
        soup = BeautifulSoup(r.text, 'html.parser')
        return soup

    def get_categories(self):
        soup = self.get_soup_by_url(self.URL)
        main_categiries = {}
        for categories in soup.find('div', class_='subcategory-list').find_all('li'):
            cat_name = categories.find('a').text.strip()
            cat_url = categories.find('a').get('href')
            main_categiries[cat_name] = cat_url
        return main_categiries

    def get_subcat_product_urls(self):
        next_url = []
        for page in self.get_categories().values():
            soup = self.get_soup_by_url(page)
            first_page = int(soup.find('strong', class_='page').find_all('span')[1].text.strip())
            for page_count in range(first_page, 51):
                needed_url = page + '?p={}'.format(page_count)
                next_url.append(needed_url)
        return next_url

    def get_all_product_urls(self):
        all_pages = self.get_subcat_product_urls()
        all_pages_url = []
        for pages in all_pages:
            soup = self.get_soup_by_url(pages)
            all_product_url = soup.find('div', class_='product-item-details').find('a')
            all_pages_url.append(all_product_url.get('href'))
        return all_pages_url

    def get_all_product_data(self):
        all_links = self.get_all_product_urls()
        all_data = {}
        for product in all_links:
            soup = self.get_soup_by_url(product)
            for i in soup.find_all('div', class_='characteristics-item'):
                key = i.find('div', class_='col label').text.strip()
                value = i.find('div', class_='col data').text.strip()
                all_data[key] = value
        return all_data

    def get_total(self):
        total = {}
        main_cat = self.get_categories()
        subcat = self.get_all_product_data()
        for m in main_cat.keys():
            total[m] = subcat
        return total


res = EvaParser().get_total()
print(res)

