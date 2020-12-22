from .models import Post, Category
from .forms import CommentForm
from django.views.generic import DetailView, ListView
from django.shortcuts import render


class HomeView(ListView):
    model = Post
    template_name = 'post_list.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = Post.objects.first()
        context['article'] = Post.objects.values('article').first()
        context['category'] = Category.objects.all()
        context['politics'] = Category.objects.filter(cat_name='Politics').values()
        return context

    def comment(self):
        comments = Post.objects.filter(commentator=True)
        if self.method == 'POST':
            comment_form = CommentForm(self.POST)
            if comment_form.is_valid():
                new_comment = comment_form.save()
                new_comment.save()
        else:
            comment_form = CommentForm()
        return render(self, 'post_list.html', {'comments': comments, 'comment_form': comment_form})

class PostDetailView(DetailView):
    model = Post
    template_name = 'post_detail.html'


