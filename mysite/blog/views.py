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


class PostDetailView(DetailView):
    model = Post
    template_name = 'post_detail.html'

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

