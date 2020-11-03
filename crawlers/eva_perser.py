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
            cat_name = categories.find('a').get_text(strip=True)
            cat_url = categories.find('a').get('href')
            main_categiries[cat_name] = [cat_url]
        return main_categiries

    def get_subcategories(self):
        category_data = self.get_categories()
        #data = {i: {} for i in category_data.keys()}
        data = {}
        for cat_name, cat_url in category_data.items():
            soup = self.get_soup_by_url(cat_url)
            for subcat_tag in soup.find('div', class_="product details product-item-details").find('a'):
                    subcat_url = subcat_tag.get('href')
                    subcat_name = subcat_tag.text.strip()
                    data[cat_name][subcat_name] = subcat_url
            return data

res = EvaParser().get_subcategories()
print(res)

