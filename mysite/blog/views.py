from .models import Post, Category
from .forms import CommentForm
from django.views.generic import DetailView, ListView
from django.shortcuts import render, get_object_or_404


class HomeView(ListView):
    model = Post
    template_name = 'post_list.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['category'] = Category.objects.all()
        context['article'] = Post.objects.all().values()
        return context

def post_list(request, pk):
    post = get_object_or_404(Post, pk=pk)
    return render(request, 'post_detail.html', {'post': post})


class PostDetailView(DetailView):
    model = Post
    template_name = 'post_detail.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['politics'] = Post.objects.filter(category_id=3).values()
        context['technics'] = Post.objects.filter(category_id=4).values()
        context['science'] = Post.objects.filter(category_id=2).all().values()
        # context['history'] = Post.objects.filter(category='History').values()
        # context['music'] = Post.objects.filter(category='Music').values()
        return context

def comment(request, pk):
    comments = Post.objects.filter(commentator=True)
    post = get_object_or_404(Post, pk=pk)
    if request.method == 'POST':
        comment_form = CommentForm(request.POST)
        if comment_form.is_valid():
            new_comment = comment_form.save()
            new_comment.save()
        else:
            comment_form = CommentForm()
    return render(request, 'post_list.html', {'post': post, 'comments': comments, 'comment_form': comment_form})

