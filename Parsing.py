from com import BasicProductPage


class Product(BasicProductPage):

    def get_div(self):
        div_list = self.soup.find_all('div', class_="baseline-helper")
        return div_list

    def get_p(self, html):
        htlm = self.get_links()
        needed_p = self.get_div()
        data = []
        for p in needed_p:
            data.append(
                {
                    'brand': p.find('p', class_="designer-info fs10 up ls2 bold").get_text(strip=True),
                    'product description': p.find('p', class_="item-info fs10 up ls2").get_text(strip=True),
                    'price': p.find('span', itemprop="price").get_text(strip=True),
                    'currency': p.find('p', class_="item-price fs10 filter-item up ls2").get_text(strip=True)[4:]
                }
            )
        return data

    def get_links(self):
        html = self.URL
        pages = [html]
        for page in range(2, 41):
            pages_link = 'https://ultra-shop.com/men/odezhda?page={}'.format(page)
            pages.append(pages_link)
        return pages

    def parser(self):
        needed_links = self.get_links()
        product_dict = []
        for link in needed_links:
            product_dict = self.get_p(link)
            return product_dict

res = Product().parser()
print(res)