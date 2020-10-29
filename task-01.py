from common import BasicProductPageParser


class Product(BasicProductPageParser):

    def get_ul(self):
        ul_list = self.soup.find_all('ul', class_='text')
        needed_ul = ul_list[0]
        return needed_ul

    def get_li(self):
        needed_ul = self.get_ul()
        data = {}
        for li in needed_ul.find_all('li'):
            li = li.text.strip().split(':')
            key = li[0]
            value = li[1].strip()
            data[key] = value
        return data


p = Product().get_li()
print(p)
