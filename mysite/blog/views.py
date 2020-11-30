from .models import Post
from django.views.generic import DetailView, ListView


class HomeView(ListView):
    model = Post
    template_name = 'post_list.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = Post.objects.first()
        context['article'] = Post.objects.values('article').get(pk=2)
        return context

class PostDetailView(DetailView):
    model = Post
    template_name = 'post_detail.html'

