from other.com import BasicProductPage


class Product(BasicProductPage):

    def get_links(self):
        html = self.URL
        pages = [html]
        for page in range(2, 41):
            pages_link = html + '?page={}'.format(page)
            pages.append(pages_link)
        return pages

    def get_p(self):
        needed_p = self.soup.find_all('div', class_="baseline-helper")
        self.get_links()
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


res = Product().get_p()
print(res)
